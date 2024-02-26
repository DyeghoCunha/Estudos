import mongoose, { Model } from 'mongoose';

interface WeaponSkin {
  id: string;
  name: string;
  image: string;
  color: string[];
  colorHsl: { h: number; s: number; l: number }[];
  colorName: string[];
}

const weaponSkinSchema = new mongoose.Schema<WeaponSkin>({
  id: { type: String, required:false, unique: true },
  name: { type: String, required: false},
  image: { type: String, required: false},
  color: { type: [String], required: false},
  colorHsl: { type: [{ h: Number, s: Number, l: Number }], required: false},
  colorName: { type: [String], required: false},
});

let WeaponSkinModel: Model<WeaponSkin> | null = null;

try {
  WeaponSkinModel = mongoose.model('WeaponSkin');
} catch {
  WeaponSkinModel = mongoose.model('WeaponSkin', weaponSkinSchema);
}

export default WeaponSkinModel;
