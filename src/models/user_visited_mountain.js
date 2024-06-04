import { Model, DataTypes } from "sequelize";
import sequelize from "../config/database.js";

class UserVisitedMountain extends Model {}

UserVisitedMountain.init(
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
    tableName: "user_visited_mountain",
  }
);

export default UserVisitedMountain;
