import jwt from "jsonwebtoken";
import dotenv from "dotenv";
dotenv.config();

export const auth = async (req, res, next) => {
  try {
    const token = req.headers.authorization.split(" ")[1];
    const decodedToken = jwt.verify(token, process.env.JWT_SECRET);
    const tokenUserId = decodedToken.id;

    if (req.body.user_id && parseInt(req.body.user_id) !== tokenUserId) {
      throw "Invalid user ID";
    } else {
      next();
    }
  } catch (error) {
    console.error("Error while checking user", error.message);
    res.status(401).json({
      message: "User not authenticated",
    });
  }
};
