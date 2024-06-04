import { Model, DataTypes } from "sequelize";
import sequelize from "../config/database.js";

class CountryHasRegion extends Model {}

CountryHasRegion.init(
  {
    country_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    region_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "country_has_region",
  }
);

export default CountryHasRegion;
