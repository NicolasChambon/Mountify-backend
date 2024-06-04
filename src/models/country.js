// /models/country.js

import { Model, DataTypes } from "sequelize";
import sequelize from "../config/database.js";

class Country extends Model {}

Country.init(
  {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "country",
  }
);

export default Country;
