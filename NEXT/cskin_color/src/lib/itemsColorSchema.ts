import { ItemWithColor } from '@/context/weaponsContext';
import mongoose, { Model } from 'mongoose';



const weaponSkinSchema = new mongoose.Schema<ItemWithColor>({
  id: { type: String, required:false, unique: true },
  name: { type: String, required: false},
  image: { type: String, required: false},
  color: { type: [String], required: false},
  colorHsl: { type: [{ h: Number, s: Number, l: Number }], required: false},
  colorName: { type: [String], required: false},
});

let WeaponSkinModel: Model<ItemWithColor> | null = null;

try {
  WeaponSkinModel = mongoose.model('WeaponSkin');
} catch {
  WeaponSkinModel = mongoose.model('WeaponSkin', weaponSkinSchema);
}

export default WeaponSkinModel;
