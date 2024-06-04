// /models/region.js

import { Model, DataTypes } from "sequelize";
import sequelize from "../config/database.js";

class Region extends Model {}

Region.init(
  {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "region",
  }
);

export default Region;
