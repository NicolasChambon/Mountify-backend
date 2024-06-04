// server.js

import express from "express";
import cors from "cors";
import bodyParser from "body-parser";
import dotenv from "dotenv";
dotenv.config();
import path from "path";

import sequelize from "./config/database.js";

import router from "./routes/indexRoutes.js";

// Init express (Creation of an Express application instance)
const app = express();

// Body parser middleware
// limit: "10mb" is used to increase the limit of the request body size which is 1mb by default
// extended: true is used to allow parsing of nested objects
app.use(bodyParser.json({ limit: "10mb", extended: true }));
// urlencoded is used to parse the data sent from the client
app.use(bodyParser.urlencoded({ limit: "10mb", extended: true }));

// Serve static files from the "public" directory
const __dirname = path.resolve();
app.use("/images", express.static(path.join(__dirname, "public/images")));

// use express json
app.use(express.json());

// use cors
app.use(cors());

// Establish database connection
// ()() syntax is used to call the asynchronous function directly after defining it
(async () => {
  try {
    await sequelize.authenticate();
    console.log("Database connection established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
    throw new Error("Failed to connect to the database");
  }
})();

// use router
app.use(router);

// Error handling
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: "Internal Server Error" });
});

// Define port
const PORT = process.env.MOUNTIFY_PORT;

// listen on port
app.listen(PORT, () => console.log(`Server running at ${PORT}`));
