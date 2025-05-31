// ignore: unused_import
import 'package:bagani_agi/dashboard.dart';
import 'package:bagani_agi/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AgricultureShopApp());
}

class AgricultureShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'কৃষি বিপণী',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: ShopHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShopHomeScreen extends StatefulWidget {
  @override
  _ShopHomeScreenState createState() => _ShopHomeScreenState();
}

class _ShopHomeScreenState extends State<ShopHomeScreen> {
  int _currentIndex = 0;
  final List<Product> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: Navigator.canPop(context)
        ? IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SmartFarmingApp()),
            (route) => false,
          );
            },
          )
        : null,
        title: Text('কৃষি বিপণী', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
        icon: Stack(
          children: [
            Icon(Icons.shopping_cart_outlined, size: 24),
            if (_cartItems.isNotEmpty)
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
            _cartItems.length.toString(),
            style: TextStyle(color: Colors.white, fontSize: 10),
            textAlign: TextAlign.center,
              ),
            ),
          ),
          ],
        ),
        onPressed: () => _navigateToCart(),
          ),
        ],
        elevation: 0,
      ),

      
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildCategories(),
            _buildFeaturedProducts('জনপ্রিয় পণ্য'),
            _buildFeaturedProducts('নতুন পণ্য'),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'হোম',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'অন্বেষণ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'পছন্দ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'প্রোফাইল',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'বীজ, সরঞ্জাম ইত্যাদি খুঁজুন...',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {
        'icon': Icons.grass, 
        'name': 'বীজ', 
        'color': Color(0xFF4CAF50),
        'onTap': () => _navigateToCategoryPage('বীজ')
      },
      {
        'icon': Icons.water_drop_outlined, 
        'name': 'সার', 
        'color': Color(0xFFFBC02D),
        'onTap': () => _navigateToCategoryPage('সার')
      },
      {
        'icon': Icons.construction_outlined, 
        'name': 'সরঞ্জাম', 
        'color': Color(0xFF5C6BC0),
        'onTap': () => _navigateToCategoryPage('সরঞ্জাম')
      },
      {
        'icon': Icons.air_outlined, 
        'name': 'কীটনাশক', 
        'color': Color(0xFF26C6DA),
        'onTap': () => _navigateToCategoryPage('কীটনাশক')
      },
      {
        'icon': Icons.agriculture_outlined, 
        'name': 'যন্ত্রপাতি', 
        'color': Color(0xFFEF5350),
        'onTap': () => _navigateToCategoryPage('যন্ত্রপাতি')
      },
    ];

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final item = categories[index];
          return GestureDetector(
            onTap: item['onTap'] as VoidCallback,
            child: Container(
              width: 80,
              margin: EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: item['color'] as Color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(item['icon'] as IconData, color: Colors.white, size: 24),
                  ),
                  SizedBox(height: 8),
                  Text(item['name'] as String, 
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedProducts(String title) {
    final products = [
      Product(
        id: '1',
        name: 'বেগুনের বীজ',
        price: 120.00,
        imageUrl: 'https://i.postimg.cc/3wKKV78D/begun-seed.jpg',
        rating: 4.5,
        category: 'বীজ',
      ),
      Product(
        id: '2',
        name: 'জৈব সার',
        price: 240.00,
        imageUrl: 'https://i.postimg.cc/wTmTs043/joibo-sar.jpg',
        rating: 4.2,
        category: 'সার',
      ),
      Product(
        id: '3',
        name: 'স্প্রে মেশিন',
        price: 1250.00,
        imageUrl: 'https://i.postimg.cc/nV5hz6k6/spray-machine.jpg',
        rating: 4.8,
        category: 'সরঞ্জাম',
      ),
      Product(
        id: '4',
        name: 'ধনিয়ার বীজ',
        price: 80.00,
        imageUrl: 'https://i.postimg.cc/6QY9NSqb/dhoniya-seed.jpg',
        rating: 3.9,
        category: 'বীজ',
      ),
      Product(
        id: '5',
        name: 'পেঁপের বীজ',
        price: 150.00,
        imageUrl: 'https://i.postimg.cc/g2yzgrWW/papaiya-seed.jpg',
        rating: 4.1,
        category: 'বীজ',
      ),
      Product(
        id: '6',
        name: 'মুলার বীজ',
        price: 90.00,
        imageUrl: 'https://i.postimg.cc/CxpMCk97/mula-seed.jpg',
        rating: 4.0,
        category: 'বীজ',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('সব দেখুন', style: TextStyle(color: Colors.green, fontSize: 14)),
            ],
          ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                onAddToCart: () => _addToCart(products[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  void _addToCart(Product product) {
    setState(() {
      _cartItems.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} কার্টে যোগ করা হয়েছে'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen(cartItems: _cartItems)),
    );
  }

  void _navigateToCategoryPage(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryPage(category: category)),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    // Sample products for each category
    final List<Product> categoryProducts = [
      Product(
        id: '1',
        name: '$category পণ্য ১',
        price: 100.00,
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.0,
        category: category,
      ),
      Product(
        id: '2',
        name: '$category পণ্য ২',
        price: 150.00,
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.2,
        category: category,
      ),
      Product(
        id: '3',
        name: '$category পণ্য ৩',
        price: 200.00,
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.5,
        category: category,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          final product = categoryProducts[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
              ),
              title: Text(product.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('৳${product.price.toStringAsFixed(2)}'),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(' ${product.rating}'),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} কার্টে যোগ করা হয়েছে'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      product.imageUrl,
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 120,
                        color: Colors.grey[200],
                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 120,
                          color: Colors.grey[200],
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          SizedBox(width: 2),
                          Text(
                            product.rating.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.category, 
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                    SizedBox(height: 4),
                    Text(product.name, 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('৳${product.price.toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        InkWell(
                          onTap: onAddToCart,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(Icons.add, color: Colors.white, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('পণ্যের বিবরণ'),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[200],
                      child: Center(
                        child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                      ),
                    ),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          product.rating.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.category, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  Text(product.name, 
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(' ${product.rating} (১২৪ রিভিউ)'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('৳${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 24),
                  Text('বিবরণ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    'উচ্চ মানের ${product.name} পেশাদার চাষাবাদের জন্য। এই পণ্যটি কৃষি বিশেষজ্ঞদের দ্বারা পরীক্ষিত এবং সর্বাধিক ফলনের জন্য অনুমোদিত।',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('কার্টে যোগ করুন', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;

  const CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final total = cartItems.fold(0.0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(title: Text('আমার কার্ট')),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 48, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('আপনার কার্ট খালি', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('আমাদের পণ্য ব্রাউজ করুন এবং কার্টে আইটেম যোগ করুন'),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: Image.network(
                            item.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
                          ),
                          title: Text(item.name),
                          subtitle: Text('৳${item.price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Colors.grey[200]!)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('মোট', style: TextStyle(fontSize: 18)),
                          Text('৳${total.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: Text('চেকআউট', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final double rating;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.category,
  });
}