import express from "express";
import {
  listMountains,
  getMountains,
  getMountainById,
  createMountain,
  updateMountain,
  deleteMountain,
} from "../controllers/mountainController.js";

import { auth } from "../middleware/auth.js";

const router = express.Router();

router.get("/list", listMountains);
router.post("/", auth, createMountain);

router.get("/", getMountains);
router.get("/:id", getMountainById);
router.put("/:id", updateMountain);
router.delete("/:id", deleteMountain);

export default router;
