import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import sanitizeHtml from "sanitize-html";
import dotenv from "dotenv";
dotenv.config();

import { User } from "../models/index.js";

// Register a new user
export const register = async (req, res) => {
  const errorMessages = []; // Array to store errors to display to the user

  // Sanitize inputs
  req.body.username = sanitizeHtml(req.body.username);
  req.body.email = sanitizeHtml(req.body.email);

  // Check if username is filled
  if (!req.body.username) {
    errorMessages.push("Veuillez renseigner un nom d'utilisateur");
  }

  // Check if username already exists
  try {
    const username = await User.findOne({
      where: { username: req.body.username },
    });
    if (username) {
      errorMessages.push("Ce nom d'utilisateur est déjà pris");
    }
  } catch (error) {
    console.error("Error while checking username", error.message);
    res.status(500).json({
      message: "Error while checking username",
      error: error.message,
    });
  }

  // Check username format :
  if (!/^[a-zA-Z][a-zA-Z0-9_-]{2,}$/.test(req.body.username)) {
    errorMessages.push(
      "Le nom d'utilisateur doit : contenir au moins 3 caractères / commencer par une lettre / ne pas contenir d'espace et caractères spéciaux sauf - et _"
    );
  }

  // Check if email is filled
  if (!req.body.email) {
    errorMessages.push("Veuillez renseigner une adresse email");
  }

  // Check if email already exists
  try {
    const email = await User.findOne({
      where: { email: req.body.email },
    });
    if (email) {
      errorMessages.push("Cette adresse email est déjà prise");
    }
  } catch (error) {
    console.error("Error while checking email", error.message);
    res.status(500).json({
      message: "Error while checking email",
      error: error.message,
    });
  }

  // Check email format
  if (
    !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(req.body.email)
  ) {
    errorMessages.push("Veuillez renseigner une adresse email valide");
  }

  // Check if password is filled
  if (!req.body.password) {
    errorMessages.push("Veuillez renseigner un mot de passe");
  }

  // Check if password confirmation is filled
  if (!req.body.passwordConfirm) {
    errorMessages.push("Veuillez confirmer le mot de passe");
  }

  // Check if password and password confirmation match
  if (req.body.password !== req.body.passwordConfirm) {
    errorMessages.push("Les mots de passe ne correspondent pas");
  }

  // Check password format (no space, at least 8 characters, one lowercase letter, one uppercase letter, one number and one special character among !@#$%^&*()_-+={}[]:;"'|\,.<>?/`)
  if (
    !/^(?!.*\s)(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_\-+={}[\];:"'\\|,.<>?/`~]).{8,}$/.test(
      req.body.password
    )
  ) {
    errorMessages.push(
      "Le mot de passe doit contenir au moins 8 caractères dont une lettre minuscule une lettre majuscule un chiffre un caractère spécial et aucun espace"
    );
  }

  // Check if errorMessages
  if (errorMessages.length > 0) {
    return res.status(400).json({ errorMessages });
  }

  // Hash password
  try {
    const hash = await bcrypt.hash(req.body.password, 12);
    try {
      const user = await User.create({
        username: req.body.username,
        email: req.body.email,
        password_hash: hash,
        picture: "https://www.svgrepo.com/show/499764/user.svg",
      });
      res.status(201).json({
        message: "User Created Successfully",
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
        },
      });
    } catch (error) {
      console.error("Error while creating user", error.message);
      res.status(500).json({
        message: "Error while creating user",
        error: error.message,
      });
    }
  } catch (error) {
    console.error("Error while hashing password", error.message);
    res.status(500).json({
      message: "Error while hashing password",
      error: error.message,
    });
  }
};

// Authenticate user
export const login = async (req, res) => {
  const errorMessages = []; // Array to store errors to display to the user

  // Check if username is filled
  if (!req.body.username) {
    errorMessages.push("Veuillez renseigner un nom d'utilisateur");
  }

  // Check if password is filled
  if (!req.body.password) {
    errorMessages.push("Veuillez renseigner un mot de passe");
  }

  // Check if errorMessages
  if (errorMessages.length > 0) {
    return res.status(400).json({ errorMessages });
  }

  // Check if user exists
  try {
    const user = await User.findOne({
      where: { username: req.body.username },
    });
    if (!user) {
      return res
        .status(401)
        .json({ message: "Nom d'utilisateur ou mot de passe incorrect" });
    }

    // Compare password
    try {
      const valid = await bcrypt.compare(req.body.password, user.password_hash);
      if (!valid) {
        return res
          .status(401)
          .json({ message: "Nom d'utilisateur ou mot de passe incorrect" });
      }
      res.status(200).json({
        message: "User Logged In Successfully",
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
          picture: user.picture,
          token: jwt.sign({ id: user.id }, process.env.JWT_SECRET, {
            expiresIn: "24h",
          }),
        },
      });
    } catch (error) {
      console.error("Error while comparing password", error.message);
      res.status(500).json({
        message: "Error while comparing password",
        error: error.message,
      });
    }
  } catch (error) {
    console.error("Error while checking username", error.message);
    res.status(500).json({
      message: "Error while checking username",
      error: error.message,
    });
  }
};

// Get all users
export const getUsers = async (req, res) => {
  try {
    const users = await User.findAll();
    if (!users) {
      console.error("No users found");
      return res.status(404).json({ message: "No users found" });
    }
    res.status(200).json(users);
  } catch (error) {
    console.error("Error while getting users", error.message);
    res.status(500).json({
      message: "Error while getting users",
      error: error.message,
    });
  }
};

// Get user by id
export const getUserById = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id);
    if (!user) {
      console.error("No user found");
      return res.status(404).json({ message: "No user found" });
    }
    res.status(200).json(user);
  } catch (error) {
    console.error("Error while getting user", error.message);
    res.status(500).json({
      message: "Error while getting user",
      error: error.message,
    });
  }
};

// Update user by id
export const updateUser = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id);
    if (!user) {
      console.error("No user found");
      return res.status(404).json({ message: "No user found" });
    }
    await user.update(req.body);
    res.status(200).json({
      message: "User Updated",
      user,
    });
  } catch (error) {
    console.error("Error while updating user", error.message);
    res.status(500).json({
      message: "Error while updating user",
      error: error.message,
    });
  }
};

// Delete user by id
export const deleteUser = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id);
    if (!user) {
      console.error("No user found");
      return res.status(404).json({ message: "No user found" });
    }
    await user.destroy();
    res.status(200).json({
      message: "User Deleted",
    });
  } catch (error) {
    console.error("Error while deleting user", error.message);
    res.status(500).json({
      message: "Error while deleting user",
      error: error.message,
    });
  }
};
