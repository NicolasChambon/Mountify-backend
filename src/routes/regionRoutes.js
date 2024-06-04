import express from "express";
import {
  getRegions,
  getRegionById,
  createRegion,
  updateRegion,
  deleteRegion,
} from "../controllers/regionController.js";

const router = express.Router();

router.get("/", getRegions);
router.get("/:id", getRegionById);
router.post("/", createRegion);
router.put("/:id", updateRegion);
router.delete("/:id", deleteRegion);

export default router;
