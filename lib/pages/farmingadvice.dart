import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class FarmingAdvicePage extends StatefulWidget {
  @override
  _FarmingAdvicePageState createState() => _FarmingAdvicePageState();
}

class _FarmingAdvicePageState extends State<FarmingAdvicePage> {
  final List<AdviceItem> adviceList = [
    AdviceItem(
      title: 'ধান চাষের আধুনিক পদ্ধতি',
      details: '''
1. উচ্চ ফলনশীল জাত নির্বাচন করুন
2. সঠিক সময়ে বীজ বপন করুন
3. সমন্বিত পোকা ব্যবস্থাপনা প্রয়োগ করুন
4. সুষম সার ব্যবহার করুন
5. আধুনিক সেচ পদ্ধতি ব্যবহার করুন''',
      image: 'assets/rice_cultivation.jpg',
      rating: 4.2,
      date: DateTime(2023, 5, 15),
      isFavorite: false,
    ),
    AdviceItem(
      title: 'সেচ ব্যবস্থাপনা',
      details: '''
1. ফসলের চাহিদা অনুযায়ী সেচ দিন
2. ড্রিপ সেচ পদ্ধতি ব্যবহার করুন
3. মাটির আর্দ্রতা পর্যবেক্ষণ করুন
4. বৃষ্টির পানি সংরক্ষণ করুন
5. সেচের সময় সকাল বা সন্ধ্যা বেছে নিন''',
      image: 'assets/irrigation.jpg',
      rating: 4.5,
      date: DateTime(2023, 6, 20),
      isFavorite: true,
    ),
    AdviceItem(
      title: 'ফসল ঘূর্ণনের সুবিধা',
      details: '''
1. মাটির উর্বরতা বৃদ্ধি পায়
2. পোকা ও রোগের প্রকোপ কমে
3. মাটির গঠন উন্নত হয়
4. আগাছা নিয়ন্ত্রণে সহায়ক
5. বিভিন্ন পুষ্টি উপাদানের সুষম ব্যবহার''',
      image: 'assets/crop_rotation.jpg',
      rating: 4.0,
      date: DateTime(2023, 4, 10),
      isFavorite: false,
    ),
    AdviceItem(
      title: 'জৈব সারের ব্যবহার',
      details: '''
1. মাটির স্বাস্থ্য উন্নত করে
2. পরিবেশ বান্ধব
3. দীর্ঘমেয়াদী সুফল দেয়
4. ফসলের পুষ্টিগুণ বৃদ্ধি করে
5. কম খরচে বেশি লাভ''',
      image: 'assets/organic_fertilizer.jpg',
      rating: 4.7,
      date: DateTime(2023, 7, 5),
      isFavorite: false,
    ),
    AdviceItem(
      title: 'জলবায়ু পরিবর্তনের সাথে খাপ খাওয়ানো',
      details: '''
1. খরা সহনশীল জাত চাষ করুন
2. মালচিং পদ্ধতি প্রয়োগ করুন
3. জলাবদ্ধতা প্রতিরোধী ব্যবস্থা নিন
4. আবহাওয়া পূর্বাভাস অনুসরণ করুন
5. মিশ্র চাষ পদ্ধতি গ্রহণ করুন''',
      image: 'assets/climate_change.jpg',
      rating: 4.3,
      date: DateTime(2023, 8, 12),
      isFavorite: false,
    ),
  ];

  String _searchQuery = '';
  bool _showFavoritesOnly = false;
  String _sortBy = 'date';

  @override
  Widget build(BuildContext context) {
    final filteredAdvice = adviceList.where((advice) {
      final matchesSearch = advice.title.toLowerCase().contains(_searchQuery.toLowerCase()) || 
                          advice.details.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesFavorite = !_showFavoritesOnly || advice.isFavorite;
      return matchesSearch && matchesFavorite;
    }).toList();

    filteredAdvice.sort((a, b) {
      if (_sortBy == 'date') {
        return b.date.compareTo(a.date);
      } else if (_sortBy == 'rating') {
        return b.rating.compareTo(a.rating);
      } else {
        return a.title.compareTo(b.title);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("চাষাবাদ সংক্রান্ত পরামর্শ"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: AdviceSearchDelegate(adviceList),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _sortBy = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'date',
                child: Text("সর্বশেষ প্রথম"),
              ),
              PopupMenuItem(
                value: 'rating',
                child: Text("রেটিং অনুযায়ী"),
              ),
              PopupMenuItem(
                value: 'title',
                child: Text("শিরোনাম অনুযায়ী"),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'পরামর্শ খুঁজুন...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _showFavoritesOnly ? Icons.favorite : Icons.favorite_border,
                    color: _showFavoritesOnly ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      _showFavoritesOnly = !_showFavoritesOnly;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: filteredAdvice.length,
              itemBuilder: (context, index) {
                final advice = filteredAdvice[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdviceDetailPage(advice: advice),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            advice.image,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 150,
                              color: Colors.grey[200],
                              child: Icon(Icons.image, size: 50),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            advice.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              RatingBarIndicator(
                                rating: advice.rating,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20,
                                direction: Axis.horizontal,
                              ),
                              SizedBox(height: 4),
                              Text(
                                DateFormat('dd MMMM yyyy').format(advice.date),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              advice.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: advice.isFavorite ? Colors.red : null,
                            ),
                            onPressed: () {
                              setState(() {
                                advice.isFavorite = !advice.isFavorite;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddAdviceDialog(context);
        },
      ),
    );
  }

  void _showAddAdviceDialog(BuildContext context) {
    final titleController = TextEditingController();
    final detailsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("নতুন পরামর্শ যোগ করুন"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "শিরোনাম"),
            ),
            TextField(
              controller: detailsController,
              decoration: InputDecoration(labelText: "বিস্তারিত"),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text("বাতিল"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text("যোগ করুন"),
            onPressed: () {
              if (titleController.text.isNotEmpty && detailsController.text.isNotEmpty) {
                setState(() {
                  adviceList.add(AdviceItem(
                    title: titleController.text,
                    details: detailsController.text,
                    image: 'assets/default.jpg',
                    rating: 0,
                    date: DateTime.now(),
                    isFavorite: false,
                  ));
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("পরামর্শ সফলভাবে যোগ করা হয়েছে")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class AdviceItem {
  final String title;
  final String details;
  final String image;
  double rating;
  final DateTime date;
  bool isFavorite;

  AdviceItem({
    required this.title,
    required this.details,
    required this.image,
    required this.rating,
    required this.date,
    required this.isFavorite,
  });
}

class AdviceDetailPage extends StatelessWidget {
  final AdviceItem advice;

  const AdviceDetailPage({required this.advice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(advice.title),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                advice.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: Icon(Icons.image, size: 50),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    DateFormat('dd MMMM yyyy').format(advice.date),
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                RatingBar.builder(
                  initialRating: advice.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // Update rating in the backend
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              advice.details,
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 24),
            Text(
              "মন্তব্য",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Comment section would go here
            TextField(
              decoration: InputDecoration(
                hintText: 'আপনার মন্তব্য লিখুন...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Add comment
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdviceSearchDelegate extends SearchDelegate {
  final List<AdviceItem> adviceList;

  AdviceSearchDelegate(this.adviceList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = adviceList.where((advice) =>
        advice.title.toLowerCase().contains(query.toLowerCase()) ||
        advice.details.toLowerCase().contains(query.toLowerCase())).toList();

    return _buildSearchResults(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = adviceList.where((advice) =>
        advice.title.toLowerCase().contains(query.toLowerCase()) ||
        advice.details.toLowerCase().contains(query.toLowerCase())).toList();

    return _buildSearchResults(suggestions);
  }

  Widget _buildSearchResults(List<AdviceItem> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final advice = results[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(advice.image),
          ),
          title: Text(advice.title),
          subtitle: Text(
            advice.details.length > 100
                ? '${advice.details.substring(0, 100)}...'
                : advice.details,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdviceDetailPage(advice: advice),
              ),
            );
          },
        );
      },
    );
  }
}
