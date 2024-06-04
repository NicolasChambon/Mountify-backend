import Country from "./country.js";
import Mountain from "./mountain.js";
import Region from "./region.js";
import Species from "./species.js";
import User from "./user.js";

// Country relationships
Country.hasMany(Mountain, { foreignKey: "country_id" });
Country.belongsToMany(Species, {
  through: "country_has_region",
  foreignKey: "country_id",
});

// Mountain relationships
Mountain.belongsTo(Country, { foreignKey: "country_id" });
Mountain.belongsTo(Region, { foreignKey: "region_id" });
Mountain.belongsTo(User, { foreignKey: "user_id" });
Mountain.belongsToMany(Species, {
  through: "mountain_has_species",
  foreignKey: "mountain_id",
});
Mountain.belongsToMany(User, {
  through: "user_planned_mountain",
  foreignKey: "mountain_id",
});
Mountain.belongsToMany(User, {
  through: "user_visited_mountain",
  foreignKey: "mountain_id",
});

// Region relationships
Region.hasMany(Mountain, { foreignKey: "region_id" });
Region.belongsToMany(Country, {
  through: "country_has_region",
  foreignKey: "region_id",
});

// Species relationships
Species.belongsToMany(Mountain, {
  through: "mountain_has_species",
  foreignKey: "species_id",
});

// User relationships
User.hasMany(Mountain, { foreignKey: "user_id" });
User.belongsToMany(Mountain, {
  through: "user_planned_mountain",
  foreignKey: "user_id",
});
User.belongsToMany(Mountain, {
  through: "user_visited_mountain",
  foreignKey: "user_id",
});

export { Country, Mountain, Region, Species, User };
