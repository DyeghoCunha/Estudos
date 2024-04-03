
import { ItemNameColor } from '@/types/types';
import mongoose, { Model } from 'mongoose';



const ItemNameColorSchema = new mongoose.Schema<ItemNameColor>({
  id: { type: String, required:false, unique: true },
  name: { type: String, required: false},
  color: { type: [String], required: false},
});

let ItemNameColorModel: Model<ItemNameColor> | null = null;

try {
  ItemNameColorModel = mongoose.model('ItemNameColor');
} catch {
  ItemNameColorModel = mongoose.model('ItemNameColor', ItemNameColorSchema);
}

export default ItemNameColor;
