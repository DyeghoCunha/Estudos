import mongoose from "mongoose";

interface WeaponSkin {
  id: string;
  name: string;
  image: string;
  color: string[];
  colorHsl: { h: number; s: number; l: number }[];
  colorName: string[];
}

const weaponSkinSchema = new mongoose.Schema<WeaponSkin>({
  id: { type: String, required: true, unique: true },
  name: { type: String, required: true },
  image: { type: String, required: true },
  color: { type: [String], required: true },
  colorHsl: { type: [{ h: Number, s: Number, l: Number }], required: true },
  colorName: { type: [String], required: true },
});

export default mongoose.model<WeaponSkin>("WeaponSkin", weaponSkinSchema);
