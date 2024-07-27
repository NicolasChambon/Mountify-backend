import sanitizeHtml from "sanitize-html";
import fs from "fs"; // File System module
import path from "path";
import { promisify } from "util"; // provides a set of functions for working with asynchronous code
import { fileURLToPath } from "url"; // provides file URL resolution and parsing

// allows us to use async/await with fs
const writeFileAsync = promisify(fs.writeFile);

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

import { Mountain, Country, Region } from "../models/index.js";

// List of all mountains only with their names and coordinates
export const listMountains = async (req, res) => {
  try {
    const mountains = await Mountain.findAll({
      attributes: ["id", "name", "latitude", "longitude"],
    });
    if (!mountains) {
      return res.status(404).json({ message: "No mountains found" });
    }
    res.status(200).json(mountains);
  } catch (error) {
    console.error("Error while getting mountains list", error.message);
    res.status(500).json({
      message: "Error while getting mountains list",
      error: error.message,
    });
  }
};

// Create a new mountain
export const createMountain = async (req, res) => {
  const userErrors = []; // Array to store user errors

  // Sanitize user inputs
  req.body.name = sanitizeHtml(req.body.name);
  req.body.description = sanitizeHtml(req.body.description);

  // Check if name is filled and has at least 2 characters, at least 1 letter
  if (
    !req.body.name ||
    req.body.name.length < 2 ||
    !/[a-zA-Z]/.test(req.body.name)
  ) {
    userErrors.push("Veuilez renseigner un nom de montagne valide");
  }

  // Check if name already exists
  try {
    const name = await Mountain.findOne({
      where: { name: req.body.name },
    });
    if (name) {
      userErrors.push("Ce nom de montagne est déjà pris");
    }
  } catch (error) {
    console.error("Error while checking name", error.message);
    res.status(500).json({
      message: "Error while checking name",
      error: error.message,
    });
  }

  // Check if latitude is filled and is a valid number : between -90.000000 and 90.000000
  if (
    !req.body.latitude ||
    isNaN(req.body.latitude) ||
    req.body.latitude < -90 ||
    req.body.latitude > 90
  ) {
    userErrors.push("Veuillez renseigner une latitude valide");
  }

  // Check if longitude is filled and is a valid number : between -180.000000 and 180.000000
  if (
    !req.body.longitude ||
    isNaN(req.body.longitude) ||
    req.body.longitude < -180 ||
    req.body.longitude > 180
  ) {
    userErrors.push("Veuillez renseigner une longitude valide");
  }

  // Check if altitude is filled and is a valid number : integer between -430 and 8848
  req.body.altitude && (req.body.altitude = parseInt(req.body.altitude));
  if (
    !req.body.altitude ||
    isNaN(req.body.altitude) ||
    !Number.isInteger(req.body.altitude) ||
    req.body.altitude < -430 ||
    req.body.altitude > 8848
  ) {
    userErrors.push("Veuillez renseigner une altitude valide");
  }

  // Check if description is filled and has at least 10 characters
  if (!req.body.description || req.body.description.length < 10) {
    userErrors.push("Veuillez renseigner une description valide");
  }

  // Check if picture is filled and is a valid base64 string
  if (
    !req.body.base64picture ||
    !/^data:image\/(png|jpg|jpeg);base64,([A-Za-z0-9+/=]+)$/.test(
      req.body.base64picture
    )
  ) {
    userErrors.push("Veuillez renseigner une image valide");
  }

  // Check if country_id is filled and is a valid number
  if (!req.body.country_id || isNaN(req.body.country_id)) {
    userErrors.push("Veuillez renseigner un pays valide");
  }

  // Check if region_id is filled and is a valid number
  if (!req.body.region_id || isNaN(req.body.region_id)) {
    userErrors.push("Veuillez renseigner une région valide");
  }

  // Check if userErrors
  if (userErrors.length > 0) {
    return res.status(400).json({ userErrors });
  }

  // Save image to the server
  const imageData = req.body.base64picture.split(",")[1];
  const imageName = `${req.body.name.replace(/\s/g, "_").toLowerCase()}_${Date.now()}.jpg`;
  const imagePath = path.join(__dirname, "../../public/images/", imageName);

  // Save image to the server
  try {
    // Buffer is a global object that can be used to convert data to different encoding types
    await writeFileAsync(imagePath, Buffer.from(imageData, "base64"));
    console.log("Image saved successfully");
  } catch (error) {
    console.error("Error while saving image", error.message);
    return res.status(500).json({
      message: "Error while saving image",
      error: error,
    });
  }

  // Create mountain in the database
  try {
    const mountain = await Mountain.create({
      name: req.body.name,
      latitude: req.body.latitude,
      longitude: req.body.longitude,
      altitude: req.body.altitude,
      description: req.body.description,
      picture: `/images/${imageName}`,
      country_id: req.body.country_id,
      region_id: req.body.region_id,
      user_id: req.body.user_id,
    });
    res.status(201).json({
      message: "Mountain Created Successfully",
      mountain,
    });
  } catch (error) {
    console.error("Error while creating mountain", error.message);
    res.status(500).json({
      message: "Error while creating mountain",
      error: error.message,
    });
  }
};

// Get all mountains
export const getMountains = async (req, res) => {
  try {
    const mountains = await Mountain.findAll({
      include: [Region, Country],
    });
    if (!mountains) {
      console.error("No mountains found");
      return res.status(404).json({ message: "No mountains found" });
    }
    res.status(200).json(mountains);
  } catch (error) {
    console.error("Error while getting mountains", error.message);
    res.status(500).json({
      message: "Error while getting mountains",
      error: error.message,
    });
  }
};

// Get mountain by id
export const getMountainById = async (req, res) => {
  try {
    const mountain = await Mountain.findByPk(req.params.id);
    if (!mountain) {
      console.error("No mountain found");
      return res.status(404).json({ message: "No mountain found" });
    }
    res.status(200).json(mountain);
  } catch (error) {
    console.error("Error while getting mountain", error.message);
    res.status(500).json({
      message: "Error while getting mountain",
      error: error.message,
    });
  }
};

// Update mountain by id
export const updateMountain = async (req, res) => {
  try {
    const mountain = await Mountain.findByPk(req.params.id);
    if (!mountain) {
      console.error("No mountain found");
      return res.status(404).json({ message: "No mountain found" });
    }
    await mountain.update(req.body);
    res.status(200).json({
      message: "Mountain Updated",
      mountain,
    });
  } catch (error) {
    console.error("Error while updating mountain", error.message);
    res.status(500).json({
      message: "Error while updating mountain",
      error: error.message,
    });
  }
};

// Delete mountain by id
export const deleteMountain = async (req, res) => {
  try {
    const mountain = await Mountain.findByPk(req.params.id);
    if (!mountain) {
      console.error("No mountain found");
      return res.status(404).json({ message: "No mountain found" });
    }
    await mountain.destroy();
    res.status(200).json({
      message: "Mountain Deleted",
    });
  } catch (error) {
    console.error("Error while deleting mountain", error.message);
    res.status(500).json({
      message: "Error while deleting mountain",
      error: error.message,
    });
  }
};
