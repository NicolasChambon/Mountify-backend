// /models/species.js

import { Model, DataTypes } from "sequelize";
import sequelize from "../config/database.js";

class Species extends Model {}

Species.init(
  {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    type: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "species",
  }
);

export default Species;
