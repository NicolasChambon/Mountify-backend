// Import models
import { Country } from "../models/index.js";

// Get all countries
export const getCountries = async (req, res) => {
  try {
    const countries = await Country.findAll();
    if (!countries) {
      console.error("No countries found");
      return res.status(404).json({
        message: "No countries found",
      });
    }
    res.status(200).json(countries);
  } catch (error) {
    console.error("Error while getting countries", error.message);
    res.status(500).json({
      message: "Error while getting countries",
      error: error.message,
    });
  }
};

// Get country by id
export const getCountryById = async (req, res) => {
  try {
    const country = await Country.findByPk(req.params.id);
    if (!country) {
      console.error("No country found");
      return res.status(404).json({
        message: "No country found",
      });
    }
    res.status(200).json(country);
  } catch (error) {
    console.error("Error while getting country", error.message);
    res.status(500).json({
      message: "Error while getting country",
      error: error.message,
    });
  }
};

// Create a new country
export const createCountry = async (req, res) => {
  try {
    const country = await Country.create(req.body);
    res.status(201).json({
      message: "Country Created",
      country,
    });
  } catch (error) {
    console.error("Error while creating country", error.message);
    res.status(500).json({
      message: "Error while creating country",
      error: error.message,
    });
  }
};

// Update country by id
export const updateCountry = async (req, res) => {
  try {
    const country = await Country.findByPk(req.params.id);
    if (!country) {
      console.error("No country found");
      return res.status(404).json({
        message: "No country found",
      });
    }
    await country.update(req.body);
    res.status(200).json({
      message: "Country Updated",
      country,
    });
  } catch (error) {
    console.error("Error while updating country", error.message);
    res.status(500).json({
      message: "Error while updating country",
      error: error.message,
    });
  }
};

// Delete country by id
export const deleteCountry = async (req, res) => {
  try {
    const country = await Country.findByPk(req.params.id);
    if (!country) {
      console.error("No country found");
      return res.status(404).json({
        message: "No country found",
      });
    }
    await Country.destroy({
      where: {
        id: req.params.id,
      },
    });
    res.status(200).json({
      message: "Country Deleted",
    });
  } catch (error) {
    console.error("Error while deleting country", error.message);
    res.status(500).json({
      message: "Error while deleting country",
      error: error.message,
    });
  }
};
