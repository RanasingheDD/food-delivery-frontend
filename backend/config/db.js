import mongoose from "mongoose";

export const connectDB = async () => {
  const mongoUrl = process.env.MONGO_URL || "mongodb://localhost:27017/food-delivery";

  try {
    await mongoose.connect(mongoUrl);
    console.log("DB Connected");
  } catch (error) {
    console.error("DB connection failed:", error.message);
    process.exit(1);
  }
};
