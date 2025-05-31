import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(KrisanAIApp());
}

class KrisanAIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krisan AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Kalpurush',
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF8F9FA),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.green[800]),
          titleTextStyle: TextStyle(
            color: Colors.green[800],
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kalpurush',
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: Colors.green[800]!,
          secondary: Colors.lightGreen[400]!,
        ),
      ),
      home: KrisanAIPage(),
    );
  }
}

class KrisanAIPage extends StatefulWidget {
  @override
  _KrisanAIPageState createState() => _KrisanAIPageState();
}

class _KrisanAIPageState extends State<KrisanAIPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];

  bool _isBotTyping = false;
  bool _isListening = false;
  String _recognizedText = '';
  stt.SpeechToText _speech = stt.SpeechToText();
  final ImagePicker _picker = ImagePicker();
  File? _selectedFile;
  bool _conversationStarted = false;

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addBotMessage(
        'আসসালামু আলাইকুম রহিম ভাই! ☀️\n'
        'আমি আপনার কৃষি সহকারী, Krisan AI।\n'
        'আপনার জমির কোনো সমস্যা বা পোকার ছবি তুলে আমাকে দেখাতে পারেন, আমি চিনে বলে দেব!',
        delay: 1000,
      );
    });
  }

  void _initializeSpeech() async {
    try {
      bool available = await _speech.initialize(
        onStatus: (status) {
          if (status.toLowerCase().contains('done') ||
              status.toLowerCase().contains('notListening')) {
            _stopListening();
          }
        },
        onError: (error) {
          _stopListening();
          _showError('স্পিচ রিকগনিশনে সমস্যা: ${error.errorMsg ?? 'অজানা সমস্যা'}');
        },
      );
    } catch (e) {
      _showError('স্পিচ সিস্টেম শুরু করতে সমস্যা: $e');
    }
  }

  void _addBotMessage(String text, {int delay = 1500}) {
    setState(() {
      _messages.add({'sender': 'bot', 'text': text});
      _isBotTyping = true;
    });
    _scrollToBottom();
    
    Future.delayed(Duration(milliseconds: delay + (text.length * 10)), () {
      setState(() {
        _isBotTyping = false;
      });
      _scrollToBottom();
    });
  }

  void _startConversation() {
    if (!_conversationStarted) {
      _conversationStarted = true;
      
      Future.delayed(Duration(seconds: 2), () {
        _addUserMessage(
          'ওহে! তুই তো দেখি সত্যি সত্যি কথা বলতে পারিস! 😃\n'
          'আলাইকুম আসসালাম ভাই। আমার ধানের ক্ষেতে আজকে গিয়ে দেখি পাতায় কেমন হলদে দাগ...\n'
          'আর কিছু পোকার মতনও দেখা যাচ্ছে। খুব চিন্তায় আছি ভাই!'
        );
        
        Future.delayed(Duration(seconds: 3), () {
          _addBotMessage(
            'চিন্তা করবেন না রহিম ভাই! 🙏\n'
            'আপনার সমস্যাটা ভালোভাবে বুঝতে পারছি। আপনি যদি পোকার একটা ছবি তুলে দেন, '
            'আমি সাথে সাথে বলে দিতে পারবো এটা কোন পোকা আর এর সমাধান কি।\n\n'
            'নিচের 📷 আইকনে ক্লিক করে ছবি তুলুন বা গ্যালারি থেকে সিলেক্ট করুন।',
            delay: 2000
          );
        });
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _selectedFile = File(pickedFile.path);
        });
        
        _addUserMessage('এই পোকাটার ছবি তুললাম ভাই, দেখো তো একবার...', image: _selectedFile);
        _analyzeImage();
      }
    } catch (e) {
      _showError('ছবি নির্বাচনে সমস্যা: $e');
    }
  }

  void _analyzeImage() {
    setState(() {
      _isBotTyping = true;
    });
    
    Future.delayed(Duration(seconds: 3), () {
      _addBotMessage(
        '✅ ছবি বিশ্লেষণ সম্পূর্ণ!\n'
        'আপনার জমিতে মাজরা পোকা (Stem Borer) আক্রমণ করেছে।\n\n'
        'এই পোকা সম্পর্কে কিছু তথ্য:\n'
        '• ধান গাছের কাণ্ডের ভিতরে ঢুকে ক্ষতি করে\n'
        '• গাছের ভিতরের অংশ খেয়ে ফেলে\n'
        '• আক্রান্ত গাছের পাতা প্রথমে হলুদ হয়ে শুকিয়ে যায়\n'
        '• পরে সম্পূর্ণ গাছ মারা যেতে পারে',
        delay: 1500
      );
      
      Future.delayed(Duration(seconds: 4), () {
        _addBotMessage(
          '🔍 লক্ষণগুলো মিলে গেছে?\n'
          '১. পাতায় হলুদ দাগ\n'
          '২. গাছের গোড়ায় ছোট ছিদ্র\n'
          '৩. গাছ হেলে পড়া\n'
          '৪. নতুন কুশি কম আসা',
          delay: 1500
        );
        
        Future.delayed(Duration(seconds: 4), () {
          _addBotMessage(
            '🛡️ সমাধানের উপায়:\n\n'
            '১. প্রতি লিটার পানিতে ১ মিলি "কার্টাপ হাইড্রোক্লোরাইড ৪% জি" মিশিয়ে স্প্রে করুন\n'
            '২. বিকল্প হিসেবে নিমের তেল ব্যবহার করতে পারেন (প্রতি লিটারে ৫ মিলি)\n'
            '৩. জমিতে পর্যাপ্ত পানি রাখুন\n'
            '৪. আক্রান্ত গাছ তুলে ফেলুন\n'
            '৫. সন্ধ্যার আগে স্প্রে করলে ভালো ফল পাবেন',
            delay: 1500
          );
          
          Future.delayed(Duration(seconds: 4), () {
            _addBotMessage(
              'রহিম ভাই, আরো কোনো প্রশ্ন আছে?\n'
              'বা অন্য কোনো পোকার ছবি দেখাতে চান?\n\n'
              'আমি সবসময় আপনার পাশে আছি! 🌾',
              delay: 1500
            );
          });
        });
      });
    });
  }

  void _addUserMessage(String text, {File? image}) {
    setState(() {
      _messages.add({
        'sender': 'user', 
        'text': text,
        'image': image
      });
    });
    _scrollToBottom();
  }

  void _startListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() {
          _isListening = true;
          _recognizedText = '';
        });

        _speech.listen(
          onResult: (result) {
            setState(() {
              _recognizedText = result.recognizedWords;
              if (result.finalResult) {
                _controller.text = _recognizedText.trim();
                _handleUserResponse(_recognizedText.trim());
              }
            });
          },
          listenFor: Duration(seconds: 15),
          localeId: 'bn_BD',
        );
      }
    }
  }

  void _handleUserResponse(String text) {
    if (text.toLowerCase().contains('ছবি') || text.toLowerCase().contains('চিন')) {
      _showImagePickerDialog();
    } 
    else if (text.toLowerCase().contains('ধন্যবাদ') || text.toLowerCase().contains('শুকরিয়া')) {
      _addBotMessage(
        'আপনাকে সাহায্য করতে পেরে আমি খুব খুশি রহিম ভাই! 😊\n'
        'আল্লাহ আপনার ফসলকে সব রোগ-পোকা থেকে রক্ষা করুন। আমিন।\n'
        'আর কোনো প্রশ্ন থাকলে নিঃসংকোচে জানাবেন।'
      );
    }
    else if (text.toLowerCase().contains('কেমন আছ') || text.toLowerCase().contains('খবর')) {
      _addBotMessage(
        'আলহামদুলিল্লাহ ভালো আছি রহিম ভাই! 🌱\n'
        'আপনার জমির খবরটা শুনলে ভালো লাগবে। আজকে জমিতে গিয়েছিলেন?'
      );
    }
    else {
      _addBotMessage(
        'দুঃখিত রহিম ভাই, আমি এখনো শিখছি। �\n'
        'আপনি যদি পোকার ছবি দেন বা আপনার জমির সমস্যার কথা বলেন, '
        'আমি ভালোভাবে সাহায্য করতে পারবো ইনশাআল্লাহ।'
      );
    }
  }

  void _showImagePickerDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ছবি নির্বাচন করুন',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[800]),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImagePickerOption(
                  icon: Icons.camera_alt,
                  label: 'ক্যামেরা',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                _buildImagePickerOption(
                  icon: Icons.photo_library,
                  label: 'গ্যালারি',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePickerOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, size: 30, color: Colors.green[800]),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  void _stopListening() {
    if (_isListening) {
      _speech.stop();
      setState(() {
        _isListening = false;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isUser = message['sender'] == 'user';
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            Container(
              margin: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: Colors.green[100],
                child: Icon(Icons.eco, color: Colors.green[800]),
              ),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (message['image'] != null)
                  Container(
                    height: 180,
                    width: 240,
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: FileImage(message['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isUser 
                        ? Colors.green[800]
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isUser ? 18 : 0),
                      topRight: Radius.circular(isUser ? 0 : 18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    message['text'] ?? '',
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.grey[800],
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isUser)
            Container(
              margin: EdgeInsets.only(left: 8),
              child: CircleAvatar(
                backgroundColor: Colors.green[100],
                child: Icon(Icons.person, color: Colors.green[800]),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[100],
            child: Icon(Icons.eco, color: Colors.green[800]),
          ),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green[800]!),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Krisan AI লিখছে...",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Krisan AI - কৃষি সহকারী'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.green[100],
                        child: Icon(Icons.eco, size: 40, color: Colors.green[800]),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Krisan AI সম্পর্কে',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'বাংলাদেশি কৃষকদের জন্য তৈরি ইন্টেলিজেন্ট অ্যাপ\n\n'
                        '• পোকামাকড় চিনতে সাহায্য করে\n'
                        '• রোগের চিকিৎসা বলে দেয়\n'
                        '• কৃষি পরামর্শ দেয়\n'
                        '• ছবি দিয়ে প্রশ্ন করতে পারেন',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text('ঠিক আছে'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _startConversation(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/rice_field_bg.png'), // Add your own background
                    fit: BoxFit.cover,
                    opacity: 0.05,
                  ),
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  itemCount: _messages.length + (_isBotTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (_isBotTyping && index == _messages.length) {
                      return _buildTypingIndicator();
                    }
                    return _buildMessageBubble(_messages[index]);
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.green[800]),
                  onPressed: () => _showImagePickerDialog(),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'মেসেজ লিখুন বা ছবি আপলোড করুন...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      enabled: false,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[800],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
                    color: Colors.white,
                    onPressed: _startListening,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _speech.stop();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}