// /routes/indexRoutes.js

import express from "express";

import countryRoutes from "./countryRoutes.js";
import mainController from "../controllers/mainController.js";
import mountainRoutes from "./mountainRoutes.js";
import regionRoutes from "./regionRoutes.js";
import speciesRoutes from "./speciesRoutes.js";
import userRoutes from "./userRoutes.js";

const router = express.Router();

router.use("/api/countries", countryRoutes);
router.use("/api/mountains", mountainRoutes);
router.use("/api/regions", regionRoutes);
router.use("/api/species", speciesRoutes);
router.use("/api/users", userRoutes);

router.get("/", mainController.index);

export default router;
