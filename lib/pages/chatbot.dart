import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(AgriBotApp());
}

class AgriBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriBot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          secondary: Colors.greenAccent,
        ),
      ),
      home: AgriBotHomePage(),
    );
  }
}

class AgriBotHomePage extends StatefulWidget {
  @override
  _AgriBotHomePageState createState() => _AgriBotHomePageState();
}

class _AgriBotHomePageState extends State<AgriBotHomePage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];

  bool _isBotTyping = false;
  bool _isListening = false;
  String _recognizedText = '';
  stt.SpeechToText _speech = stt.SpeechToText();
  final ImagePicker _picker = ImagePicker();
  File? _selectedFile;

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
    // Add welcome message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _messages.add({
          'sender': 'bot',
          'text': '👋 Hello farmer! I\'m AgriBot. Ask me anything about crops, fertilizers, or pest control. You can also upload photos of plant issues.',
        });
      });
      _scrollToBottom();
    });
  }

  void _initializeSpeech() async {
    try {
      bool available = await _speech.initialize(
        onStatus: (status) {
          debugPrint('Speech status: $status');
          if (status.toLowerCase().contains('done') ||
              status.toLowerCase().contains('notListening')) {
            _stopListening();
          }
        },
        onError: (error) {
          debugPrint('Speech error: $error');
          _stopListening();
          _showError('Speech recognition error: ${error.errorMsg ?? 'Unknown error'}');
        },
      );

      if (!available) {
        _showError('Speech recognition is not available on this device.');
      }
    } catch (e) {
      _showError('Failed to initialize speech recognition: $e');
    }
  }

  void _startListening() async {
    if (!_isListening) {
      try {
        bool available = await _speech.initialize();
        if (available) {
          setState(() {
            _isListening = true;
            _recognizedText = '';
          });

          _speech.listen(
            onResult: (result) {
              setState(() {
                // Improved space handling in recognized text
                _recognizedText = result.recognizedWords;
                if (result.finalResult) {
                  _controller.text = _recognizedText.trim();
                }
              });
            },
            listenFor: Duration(seconds: 10),
            pauseFor: Duration(seconds: 3), // Increased pause time
            cancelOnError: true,
            partialResults: true,
            localeId: 'en_US',
            listenMode: stt.ListenMode.dictation, // Better for continuous speech
          );
        } else {
          _showError('Speech recognition is not available.');
        }
      } catch (e) {
        _showError('Error starting speech recognition: $e');
      }
    }
  }

  void _stopListening() {
    if (_isListening) {
      _speech.stop();
      setState(() {
        _isListening = false;
        if (_recognizedText.isNotEmpty) {
          _controller.text = _recognizedText.trim(); // Trim whitespace
        }
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _pickFile() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.insert_drive_file),
                title: Text('Document'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement document picker functionality
                  _showError('Document picker not implemented yet');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _selectedFile = File(pickedFile.path);
          _messages.add({
            'sender': 'user',
            'text': '[Image attachment]',
            'file': _selectedFile,
          });
          _isBotTyping = true;
        });
        
        _scrollToBottom();
        
        // Simulate bot analyzing the image
        await Future.delayed(Duration(seconds: 2));
        
        setState(() {
          _messages.add({
            'sender': 'bot',
            'text': '📷 Thanks for the image! Based on visual analysis, this appears to be a healthy plant. '
                'If you have specific concerns, please describe them for more accurate advice.',
          });
          _isBotTyping = false;
        });
        
        _scrollToBottom();
      }
    } catch (e) {
      _showError('Error picking image: $e');
    }
  }

  void _sendMessage(String message) async {
    String trimmedMessage = message.trim();
    if (trimmedMessage.isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': trimmedMessage});
      _isBotTyping = true;
    });

    _controller.clear();
    _recognizedText = '';
    _scrollToBottom();

    // Simulate bot thinking
    await Future.delayed(Duration(milliseconds: 800 + (trimmedMessage.length * 10)));

    setState(() {
      _messages.add({
        'sender': 'bot',
        'text': _getBotResponse(trimmedMessage),
      });
      _isBotTyping = false;
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 100,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _getBotResponse(String userMessage) {
    userMessage = userMessage.toLowerCase();
    
    if (userMessage.contains('fertilizer') || userMessage.contains('fertiliser')) {
      return '🌱 For most crops, organic compost is the best fertilizer. For specific needs:\n'
          '- Leafy greens: High nitrogen (20-10-10)\n'
          '- Fruits/vegetables: Balanced (10-10-10)\n'
          '- Root crops: Higher phosphorus (5-10-10)\n'
          'Apply fertilizer every 4-6 weeks during growing season.';
    } else if (userMessage.contains('wheat') || userMessage.contains('cereal')) {
      return '🌾 Wheat cultivation tips:\n'
          '- Ideal temperature: 15-20°C\n'
          '- Soil: Well-drained loamy soil\n'
          '- Water: 12-15 inches per season\n'
          '- Planting: Sow in rows 6-8 inches apart\n'
          '- Harvest when grains are hard and moisture <20%';
    } else if (userMessage.contains('water') || userMessage.contains('irrigation')) {
      return '💧 Watering guidelines:\n'
          '- Best time: Early morning (5-9 AM)\n'
          '- Frequency: 2-3 times weekly (adjust for rainfall)\n'
          '- Method: Drip irrigation is most efficient\n'
          '- Check soil moisture - should be damp 1 inch below surface\n'
          '- Avoid overhead watering to prevent fungal diseases';
    } else if (userMessage.contains('pest') || userMessage.contains('insect')) {
      return '🐛 Integrated Pest Management:\n'
          '1. Prevention: Crop rotation, resistant varieties\n'
          '2. Mechanical: Hand-picking, traps\n'
          '3. Biological: Ladybugs, lacewings\n'
          '4. Organic: Neem oil (2%), garlic spray\n'
          '5. Chemical: Use as last resort (follow label instructions)';
    } else if (userMessage.contains('soil') || userMessage.contains('ph')) {
      return '🌍 Soil health tips:\n'
          '- Ideal pH: 6.0-7.0 for most crops\n'
          '- Test soil annually\n'
          '- Add lime to raise pH, sulfur to lower\n'
          '- Organic matter improves all soil types\n'
          '- Cover crops prevent erosion';
    } else if (userMessage.contains('hi') || userMessage.contains('hello')) {
      return '👋 Hello farmer! How can I help with your agricultural questions today?';
    } else if (userMessage.contains('thank')) {
      return '🤗 You\'re welcome! Happy farming!';
    } else if (userMessage.contains('image') || userMessage.contains('photo') || userMessage.contains('picture')) {
      return '📷 You can upload images of plants or soil by tapping the attachment icon. I can help identify issues or provide advice based on the visuals.';
    } else {
      return '👩‍🌾 I can help with:\n'
          '- Crop advice 🌽\n'
          '- Fertilizer recommendations 🌱\n'
          '- Pest control 🐛\n'
          '- Watering schedules 💧\n'
          '- Soil management 🌍\n'
          '- Image analysis of plant issues 📷\n'
          'Ask me anything about farming!';
    }
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isUser = message['sender'] == 'user';
    
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isUser ? Colors.green[100] : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(isUser ? 16 : 0),
              bottomRight: Radius.circular(isUser ? 0 : 16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              )],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message['file'] != null)
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        message['file'],
                        width: 200,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              Text(
                message['text'],
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
            SizedBox(width: 8),
            Text(
              "AgriBot is typing...",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoiceInputIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.mic, color: Colors.red),
            SizedBox(width: 8),
            Text("Listening...", style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }

  Widget _buildChatInput() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
        )],
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.attach_file),
              color: Colors.green,
              onPressed: _pickFile,
            ),
            IconButton(
              icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
              color: _isListening ? Colors.red : Colors.green,
              onPressed: () {
                if (_isListening) {
                  _stopListening();
                } else {
                  _startListening();
                }
              },
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: _sendMessage,
                decoration: InputDecoration(
                  hintText: 'Type or speak your question...',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () => _sendMessage(_controller.text),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.green,
                child: Icon(Icons.send, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
        Navigator.of(context).maybePop();
          },
        ),
        title: Text('🌾 AgriBot - Your Farming Assistant'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 3,
        actions: [
          IconButton(
        icon: Icon(Icons.info_outline),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
          title: Text('About AgriBot'),
          content: Text(
            'AgriBot provides agricultural advice on:\n'
            '- Crop cultivation\n- Fertilizers\n- Pest control\n'
            '- Irrigation\n- Soil management\n- Image analysis\n\n'
            'Use text, voice, or upload images to ask questions.',
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
            ),
          );
        },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length + 
                         (_isBotTyping ? 1 : 0) + 
                         (_isListening && _recognizedText.isEmpty ? 1 : 0),
              itemBuilder: (context, index) {
                if (_isListening && _recognizedText.isEmpty && index == _messages.length) {
                  return _buildVoiceInputIndicator();
                }
                if (_isBotTyping && index == _messages.length + (_isListening && _recognizedText.isEmpty ? 1 : 0)) {
                  return _buildTypingIndicator();
                }
                final adjustedIndex = index - (_isListening && _recognizedText.isEmpty ? 1 : 0);
                final msg = _messages[adjustedIndex];
                return _buildMessageBubble(msg);
              },
            ),
          ),
          if (_isListening && _recognizedText.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[100],
              child: Row(
                children: [
                  Icon(Icons.mic, color: Colors.green, size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _recognizedText,
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green[800]),
                    ),
                  ),
                ],
              ),
            ),
          _buildChatInput(),
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
