import 'package:flutter/material.dart';

class MarketPricesPage extends StatefulWidget {
  @override
  _MarketPricesPageState createState() => _MarketPricesPageState();
}

class _MarketPricesPageState extends State<MarketPricesPage> {
  List<Map<String, dynamic>> prices = [
    {'crop': 'ধান', 'price': '২৫ টাকা/কেজি', 'trend': Icons.trending_up},
    {'crop': 'গম', 'price': '৩০ টাকা/কেজি', 'trend': Icons.trending_flat},
    {'crop': 'আলু', 'price': '১৮ টাকা/কেজি', 'trend': Icons.trending_down},
    {'crop': 'পাট', 'price': '২২ টাকা/কেজি', 'trend': Icons.trending_up},
    {'crop': 'সরিষা', 'price': '৪০ টাকা/কেজি', 'trend': Icons.trending_up},
  ];

  List<Map<String, dynamic>> filteredPrices = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPrices = prices;
  }

  void _filterPrices(String query) {
    setState(() {
      filteredPrices = prices
          .where((item) => item['crop'].toString().contains(query))
          .toList();
    });
  }

  Future<void> _refreshPrices() async {
    // Simulate fetching new data
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // For demo: shuffle or simulate data change
      prices.shuffle();
      filteredPrices = prices;
    });
  }

  Color _getTrendColor(IconData icon) {
    if (icon == Icons.trending_up) return Colors.green;
    if (icon == Icons.trending_down) return Colors.red;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF2F9),
      appBar: AppBar(
        title: Text("বাজারের দর ও পূর্বাভাস"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "সর্বশেষ বাজার দর (প্রতি কেজি)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: searchController,
              onChanged: _filterPrices,
              decoration: InputDecoration(
                hintText: 'পণ্যের নাম লিখুন...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshPrices,
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: filteredPrices.length,
                itemBuilder: (context, index) {
                  final item = filteredPrices[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(4, 4),
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(Icons.shopping_basket, color: Colors.blue),
                      ),
                      title: Text(
                        item['crop'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item['price']),
                      trailing: Icon(
                        item['trend'],
                        color: _getTrendColor(item['trend']),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
