import '../models/models.dart';

final List<MenuItem> menuItems = [

  // =========================
  // HOT BEVERAGES
  // =========================

  MenuItem(
    id: 'hot_001',
    name: 'Signature Masala Chai',
    category: 'Beverages',
    subCategory: 'Hot Beverages',
    price: 180,
  ),

  MenuItem(
    id: 'hot_002',
    name: 'Black Coffee',
    category: 'Beverages',
    subCategory: 'Hot Beverages',
    price: 150,
  ),

  MenuItem(
    id: 'hot_003',
    name: 'Cappuccino',
    category: 'Beverages',
    subCategory: 'Hot Beverages',
    price: 280,
  ),

  MenuItem(
    id: 'hot_004',
    name: 'Green Tea',
    category: 'Beverages',
    subCategory: 'Hot Beverages',
    price: 200,
  ),

  MenuItem(
    id: 'hot_005',
    name: 'Hot Chocolate',
    category: 'Beverages',
    subCategory: 'Hot Beverages',
    price: 290,
  ),

  // =========================
  // COLD BEVERAGES
  // =========================

  MenuItem(
    id: 'cold_001',
    name: 'Fresh Lime Soda',
    category: 'Beverages',
    subCategory: 'Cold Beverages & Juices',
    price: 220,
  ),

  MenuItem(
    id: 'cold_002',
    name: 'Mango Lassi',
    category: 'Beverages',
    subCategory: 'Cold Beverages & Juices',
    price: 280,
  ),

  MenuItem(
    id: 'cold_003',
    name: 'Seasonal Fruit Juice',
    category: 'Beverages',
    subCategory: 'Cold Beverages & Juices',
    price: 250,
  ),

  MenuItem(
    id: 'cold_004',
    name: 'Iced Americano',
    category: 'Beverages',
    subCategory: 'Cold Beverages & Juices',
    price: 260,
  ),

  MenuItem(
    id: 'cold_005',
    name: 'Virgin Mojito',
    category: 'Beverages',
    subCategory: 'Cold Beverages & Juices',
    price: 290,
  ),

  // =========================
  // MOCKTAILS
  // =========================

  MenuItem(
    id: 'mock_001',
    name: 'Himalayan Berry Blast',
    category: 'Beverages',
    subCategory: 'Mocktails & Smoothies',
    price: 350,
  ),

  MenuItem(
    id: 'mock_002',
    name: 'Tropical Sunset',
    category: 'Beverages',
    subCategory: 'Mocktails & Smoothies',
    price: 320,
  ),

  // =========================
  // VEG APPETIZERS
  // =========================

  MenuItem(
    id: 'veg_001',
    name: 'Paneer Tikka',
    category: 'Appetizers',
    subCategory: 'Veg Appetizers',
    price: 420,
  ),

  MenuItem(
    id: 'veg_002',
    name: 'Vegetable Spring Rolls',
    category: 'Appetizers',
    subCategory: 'Veg Appetizers',
    price: 350,
  ),

  MenuItem(
    id: 'veg_003',
    name: 'Aloo Chaat',
    category: 'Appetizers',
    subCategory: 'Veg Appetizers',
    price: 280,
  ),

  MenuItem(
    id: 'veg_004',
    name: 'Mushroom Galouti',
    category: 'Appetizers',
    subCategory: 'Veg Appetizers',
    price: 390,
  ),

  // =========================
  // NON-VEG APPETIZERS
  // =========================

  MenuItem(
    id: 'nonveg_001',
    name: 'Chicken Sekuwa',
    category: 'Appetizers',
    subCategory: 'Non-Veg Appetizers',
    price: 480,
  ),

  MenuItem(
    id: 'nonveg_002',
    name: 'Buffalo Lollipop',
    category: 'Appetizers',
    subCategory: 'Non-Veg Appetizers',
    price: 520,
  ),

  MenuItem(
    id: 'nonveg_003',
    name: 'Fish Finger',
    category: 'Appetizers',
    subCategory: 'Non-Veg Appetizers',
    price: 550,
  ),

  MenuItem(
    id: 'nonveg_004',
    name: 'Garlic Butter Prawns',
    category: 'Appetizers',
    subCategory: 'Non-Veg Appetizers',
    price: 650,
  ),

  // =========================
  // NEPALI KHANA
  // =========================

  MenuItem(
    id: 'nepali_001',
    name: 'Dal Bhat Set',
    category: 'Full Course',
    subCategory: 'Nepali Khana Set',
    price: 490,
  ),

  MenuItem(
    id: 'nepali_002',
    name: 'Khasi Ko Masu',
    category: 'Full Course',
    subCategory: 'Nepali Khana Set',
    price: 620,
  ),

  MenuItem(
    id: 'nepali_003',
    name: 'Kukhura Ko Jhol',
    category: 'Full Course',
    subCategory: 'Nepali Khana Set',
    price: 550,
  ),

  // =========================
  // TANDOORI & SIZZLERS
  // =========================

  MenuItem(
    id: 'tandoori_001',
    name: 'Tandoori Chicken (Half)',
    category: 'Full Course',
    subCategory: 'Tandoori & Sizzlers',
    price: 590,
  ),

  MenuItem(
    id: 'tandoori_002',
    name: 'Chili Chicken Sizzler',
    category: 'Full Course',
    subCategory: 'Tandoori & Sizzlers',
    price: 680,
  ),

  MenuItem(
    id: 'tandoori_003',
    name: 'Paneer Shashlik Sizzler',
    category: 'Full Course',
    subCategory: 'Tandoori & Sizzlers',
    price: 590,
  ),

  // =========================
  // CONTINENTAL & PASTA
  // =========================

  MenuItem(
    id: 'continental_001',
    name: 'Grilled Fish with Lemon Butter',
    category: 'Full Course',
    subCategory: 'Continental & Pasta',
    price: 790,
  ),

  MenuItem(
    id: 'continental_002',
    name: 'Chicken Alfredo Pasta',
    category: 'Full Course',
    subCategory: 'Continental & Pasta',
    price: 620,
  ),

  MenuItem(
    id: 'continental_003',
    name: 'Spaghetti Bolognese',
    category: 'Full Course',
    subCategory: 'Continental & Pasta',
    price: 640,
  ),

  // =========================
  // DESSERTS
  // =========================

  MenuItem(
    id: 'dessert_001',
    name: 'Classic Tiramisu',
    category: 'Desserts',
    subCategory: 'Desserts',
    price: 380,
  ),

  MenuItem(
    id: 'dessert_002',
    name: 'Gulab Jamun',
    category: 'Desserts',
    subCategory: 'Desserts',
    price: 290,
  ),

  MenuItem(
    id: 'dessert_003',
    name: 'Molten Lava Cake',
    category: 'Desserts',
    subCategory: 'Desserts',
    price: 420,
  ),

  MenuItem(
    id: 'dessert_004',
    name: 'Fruit Custard',
    category: 'Desserts',
    subCategory: 'Desserts',
    price: 300,
  ),

  MenuItem(
    id: 'dessert_005',
    name: 'Ice Cream Sundae',
    category: 'Desserts',
    subCategory: 'Desserts',
    price: 340,
  ),

  MenuItem(
    id: 'dessert_006',
    name: 'Kheer (Rice Pudding)',
    category: 'Desserts',
    subCategory: 'Desserts',
    price: 280,
  ),
];