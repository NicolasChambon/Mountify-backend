import { Model, DataTypes } from "sequelize";
import sequelize from "../config/database.js";

class MountainHasSpecies extends Model {}

MountainHasSpecies.init(
  {
    mountain_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    species_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "mountain_has_species",
  }
);

export default MountainHasSpecies;
