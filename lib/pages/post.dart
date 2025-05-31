import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Community Post',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const CommunityPostPage(),
    );
  }
}

class CommunityPostPage extends StatefulWidget {
  const CommunityPostPage({super.key});

  @override
  State<CommunityPostPage> createState() => _CommunityPostPageState();
}

class _CommunityPostPageState extends State<CommunityPostPage> {
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = "সব";
  bool _isLiked = false;
  int _likeCount = 24;
  bool _isBookmarked = false;
  bool _showComments = false;
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [
    "এই সমস্যার জন্য নিম তেল ব্যবহার করতে পারেন",
    "আমারও একই সমস্যা ছিল, কীটনাশক স্প্রে করলে ভালো হবে"
  ];

  // List of seed image URLs
  final List<String> _seedImages = [
    "https://i.postimg.cc/Mp1QCP6N/begun-seed.jpg",
    "https://i.postimg.cc/Pq48xC8M/cha-seed.jpg",
    "https://i.postimg.cc/CLBDNMWF/dhoniya-seed.jpg",
    "https://i.postimg.cc/ZqZd480R/khira-seed.png",
    "https://i.postimg.cc/3rbmm0fS/mula-seed.jpg",
    "https://i.postimg.cc/ncymwbJq/papaiya-seed.jpg",
  ];

  // Get a random seed image
  String get _randomSeedImage {
    final random = Random();
    return _seedImages[random.nextInt(_seedImages.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("কমিউনিটি"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            tooltip: "বিজ্ঞপ্তি",
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            tooltip: "আরও",
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          // Search bar
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "কমিউনিটিতে অনুসন্ধান করুন",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  FocusScope.of(context).unfocus();
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              // Implement search functionality
            },
          ),
          const SizedBox(height: 12),

          // Filter chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildFilterChip("সব"),
                _buildFilterChip("আলু"),
                _buildFilterChip("টেংরা"),
                _buildFilterChip("খুবানি"),
                _buildFilterChip("কফি"),
                _buildFilterChip("করলা"),
                _buildFilterChip("ধান"),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Post card
          _buildPostCard(),

          // Comments section
          if (_showComments) _buildCommentsSection(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "আপনার ফসল"),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: "কমিউনিটি"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "আপনি"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: _selectedFilter == label,
        selectedColor: Colors.green.shade100,
        onSelected: (selected) {
          setState(() {
            _selectedFilter = selected ? label : "সব";
          });
        },
      ),
    );
  }

  Widget _buildPostCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://i.postimg.cc/8z7W3Z6T/farmer-avatar.jpg'),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("রিফাত • বাংলাদেশ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("২ দিন আগে • 🥬 করলা", style: TextStyle(fontSize: 12)),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: _isBookmarked ? Colors.green : null,
                  ),
                  onPressed: () {
                    setState(() {
                      _isBookmarked = !_isBookmarked;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Image - using random seed image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                _randomSeedImage,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // Post text
            const Text(
              "আমার করলা - এর সমস্যা চিহ্নিত করতে সাহায্য করুন... "
              "প্ল্যান্টডক্টর আমার করলা -এর সম্ভাব্য সমস্যা চিহ্নিত করেছে। "
              "আমাকে বেশ কয়েকটি সম্ভাবনার কথা বলা হয়েছে: "
              "#পাতা থেকে গুড়বে পোকা, "
              "#মিষ্টি কুমড়ার কীড়াপোকা বা "
              "#স্বাস্থ্যবান ফসল। সমস্যা চিহ্নিত করুন।",
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 12),

            // Tags
            Wrap(
              spacing: 8,
              children: const [
                Chip(
                  label: Text("#করলা"),
                  backgroundColor: Colors.greenAccent,
                ),
                Chip(
                  label: Text("#ফসল_সমস্যা"),
                  backgroundColor: Colors.lightGreenAccent,
                ),
                Chip(
                  label: Text("#কৃষি_পরামর্শ"),
                  backgroundColor: Colors.lightGreen,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                        color: _isLiked ? Colors.green : null,
                      ),
                      onPressed: () {
                        setState(() {
                          _isLiked = !_isLiked;
                          _likeCount += _isLiked ? 1 : -1;
                        });
                      },
                    ),
                    Text("$_likeCount"),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () {
                    setState(() {
                      _showComments = !_showComments;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  onPressed: () {
                    _showShareDialog(context);
                  },
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Bottom interaction button
            ElevatedButton.icon(
              onPressed: () {
                _showQuestionDialog(context);
              },
              icon: const Icon(Icons.question_answer),
              label: const Text("কমিউনিটিতে প্রশ্ন করুন"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size.fromHeight(40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "মন্তব্যসমূহ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            
            // Comments list
            if (_comments.isEmpty)
              const Center(
                child: Text("কোন মন্তব্য নেই"),
              )
            else
              ..._comments.map((comment) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      child: Icon(Icons.person, size: 16),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "কৃষক",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(comment),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            
            const SizedBox(height: 12),
            
            // Add comment
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: "মন্তব্য লিখুন...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      setState(() {
                        _comments.add(_commentController.text);
                        _commentController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("শেয়ার করুন"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.facebook),
                title: const Text("ফেসবুক"),
                onTap: () {
                  Navigator.pop(context);
                  // Implement Facebook share
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text("অন্যান্য অ্যাপ"),
                onTap: () {
                  Navigator.pop(context);
                  // Implement other share options
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showQuestionDialog(BuildContext context) {
    final TextEditingController questionController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("নতুন প্রশ্ন করুন"),
          content: TextField(
            controller: questionController,
            decoration: const InputDecoration(
              hintText: "আপনার প্রশ্ন লিখুন...",
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("বাতিল"),
            ),
            ElevatedButton(
              onPressed: () {
                if (questionController.text.isNotEmpty) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("প্রশ্নটি পোস্ট করা হয়েছে")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("পোস্ট করুন"),
            ),
          ],
        );
      },
    );
  }
}