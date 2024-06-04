import { Model, DataTypes } from "sequelize";
import sequelize from "../config/database.js";

class UserPlannedMountain extends Model {}

UserPlannedMountain.init(
  {
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    mountain_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "user_planned_mountain",
  }
);

export default UserPlannedMountain;
