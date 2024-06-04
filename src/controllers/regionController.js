// Import models
import { Region } from "../models/index.js";

// Get all regions
export const getRegions = async (req, res) => {
  try {
    const regions = await Region.findAll();
    if (!regions) {
      console.error("No regions found");
      return res.status(404).json({ message: "No regions found" });
    }
    res.status(200).json(regions);
  } catch (error) {
    console.error("Error while getting regions", error.message);
    res.status(500).json({
      message: "Error while getting regions",
      error: error.message,
    });
  }
};

// Get region by id
export const getRegionById = async (req, res) => {
  try {
    const region = await Region.findByPk(req.params.id);
    if (!region) {
      console.error("No region found");
      return res.status(404).json({ message: "No region found" });
    }
    res.status(200).json(region);
  } catch (error) {
    console.error("Error while getting region", error.message);
    res.status(500).json({
      message: "Error while getting region",
      error: error.message,
    });
  }
};

// Create a new region
export const createRegion = async (req, res) => {
  try {
    const region = await Region.create(req.body);
    res.status(201).json({
      message: "Region Created",
      region,
    });
  } catch (error) {
    console.error("Error while creating region", error.message);
    res.status(500).json({
      message: "Error while creating region",
      error: error.message,
    });
  }
};

// Update region by id
export const updateRegion = async (req, res) => {
  try {
    const region = await Region.findByPk(req.params.id);
    if (!region) {
      console.error("No region found");
      return res.status(404).json({ message: "No region found" });
    }
    await region.update(req.body);
    res.status(200).json({
      message: "Region Updated",
      region,
    });
  } catch (error) {
    console.error("Error while updating region", error.message);
    res.status(500).json({
      message: "Error while updating region",
      error: error.message,
    });
  }
};

// Delete region by id
export const deleteRegion = async (req, res) => {
  try {
    const region = await Region.findByPk(req.params.id);
    if (!region) {
      console.error("No region found");
      return res.status(404).json({ message: "No region found" });
    }
    await Region.destroy({
      where: {
        id: req.params.id,
      },
    });
    res.status(200).json({
      message: "Region Deleted",
    });
  } catch (error) {
    console.error("Error while deleting region", error.message);
    res.status(500).json({
      message: "Error while deleting region",
      error: error.message,
    });
  }
};
