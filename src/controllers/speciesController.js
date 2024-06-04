// Import models
import { Species } from "../models/index.js";

// Get all species
export const getSpecies = async (req, res) => {
  try {
    const species = await Species.findAll();
    if (!species) {
      console.error("No species found");
      return res.status(404).json({ message: "No species found" });
    }
    res.status(200).json(species);
  } catch (error) {
    console.error("Error while getting species", error.message);
    res.status(500).json({
      message: "Error while getting species",
      error: error.message,
    });
  }
};

// Get species by id
export const getSpeciesById = async (req, res) => {
  try {
    const species = await Species.findByPk(req.params.id);
    if (!species) {
      console.error("No species found");
      return res.status(404).json({ message: "No species found" });
    }
    res.status(200).json(species);
  } catch (error) {
    console.error("Error while getting species", error.message);
    res.status(500).json({
      message: "Error while getting species",
      error: error.message,
    });
  }
};

// Create a new species
export const createSpecies = async (req, res) => {
  try {
    const species = await Species.create(req.body);
    res.status(201).json({
      message: "Species Created",
      species,
    });
  } catch (error) {
    console.error("Error while creating species", error.message);
    res.status(500).json({
      message: "Error while creating species",
      error: error.message,
    });
  }
};

// Update species by id
export const updateSpecies = async (req, res) => {
  try {
    const species = await Species.findByPk(req.params.id);
    if (!species) {
      console.error("No species found");
      return res.status(404).json({ message: "No species found" });
    }
    await species.update(req.body);
    res.status(200).json({
      message: "Species Updated",
      species,
    });
  } catch (error) {
    console.error("Error while updating species", error.message);
    res.status(500).json({
      message: "Error while updating species",
      error: error.message,
    });
  }
};

// Delete species by id
export const deleteSpecies = async (req, res) => {
  try {
    const species = await Species.findByPk(req.params.id);
    if (!species) {
      console.error("No species found");
      return res.status(404).json({ message: "No species found" });
    }
    await Species.destroy({
      where: {
        id: req.params.id,
      },
    });
    res.status(200).json({
      message: "Species Deleted",
    });
  } catch (error) {
    console.error("Error while deleting species", error.message);
    res.status(500).json({
      message: "Error while deleting species",
      error: error.message,
    });
  }
};
