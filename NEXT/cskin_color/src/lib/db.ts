import mongoose from "mongoose";

const connectDB = async () => {
  try {
    const uri = `mongodb+srv://dyeghocunha:055890@cskincolorfilter.ytqq0bx.mongodb.net/WeaponsWithColor?retryWrites=true&w=majority&appName=CSkinColorFilter`;
    await mongoose.connect(uri, {
      useUnifiedTopology: true,
    });
    console.log("MongoDB connected successfully!");
  } catch (error) {
    console.error("MongoDB connection error:", error);
    process.exit(1);
  }
};

export default connectDB;
