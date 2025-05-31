import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FertilizerCalculatorPage extends StatefulWidget {
  @override
  _FertilizerCalculatorPageState createState() => _FertilizerCalculatorPageState();
}

class _FertilizerCalculatorPageState extends State<FertilizerCalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  double _landArea = 0;
  String _soilType = 'দোআঁশ';
  String _cropType = 'ধান';
  String _currentFertilizerLevel = 'মধ্যম';
  bool _isCalculating = false;
  Map<String, double> _results = {};

  final List<String> _soilTypes = ['দোআঁশ', 'এটেল', 'বেলে', 'পলি', 'পিট'];
  final List<String> _cropTypes = ['ধান', 'গম', 'ভুট্টা', 'আলু', 'শাকসবজি', 'ফল'];
  final List<String> _fertLevels = ['নিম্ন', 'মধ্যম', 'উচ্চ'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("সারের পরিমাণ ক্যালকুলেটর"),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade700, Colors.green.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "আপনার জমির জন্য প্রয়োজনীয় সারের পরিমাণ নির্ণয় করুন",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "নিচের তথ্যগুলো সঠিকভাবে পূরণ করুন এবং হিসাব করুন বাটনে ক্লিক করুন",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 30),
                _buildLandAreaField(),
                SizedBox(height: 20),
                _buildSoilTypeDropdown(),
                SizedBox(height: 20),
                _buildCropTypeDropdown(),
                SizedBox(height: 20),
                _buildFertilizerLevelDropdown(),
                SizedBox(height: 40),
                _buildCalculateButton(),
                SizedBox(height: 20),
                if (_results.isNotEmpty) _buildResultsCard(),
                SizedBox(height: 20),
                _buildFertilizerInfoSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLandAreaField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "জমির আয়তন (একর)",
        labelStyle: TextStyle(color: Colors.green.shade700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade500, width: 2),
        ),
        prefixIcon: Icon(Icons.landscape, color: Colors.green.shade500),
        filled: true,
        fillColor: Colors.green.shade50,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'জমির আয়তন লিখুন';
        }
        if (double.tryParse(value) == null) {
          return 'সঠিক সংখ্যা লিখুন';
        }
        if (double.parse(value) <= 0) {
          return 'শূন্য বা তার চেয়ে বড় সংখ্যা লিখুন';
        }
        return null;
      },
      onSaved: (value) => _landArea = double.parse(value!),
    );
  }

  Widget _buildSoilTypeDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "মাটির ধরন",
        labelStyle: TextStyle(color: Colors.green.shade700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade500, width: 2),
        ),
        prefixIcon: Icon(Icons.terrain, color: Colors.green.shade500),
        filled: true,
        fillColor: Colors.green.shade50,
      ),
      value: _soilType,
      items: _soilTypes.map((type) {
        return DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _soilType = value!;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'মাটির ধরন নির্বাচন করুন';
        }
        return null;
      },
    );
  }

  Widget _buildCropTypeDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "ফসলের ধরন",
        labelStyle: TextStyle(color: Colors.green.shade700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade500, width: 2),
        ),
        prefixIcon: Icon(Icons.grass, color: Colors.green.shade500),
        filled: true,
        fillColor: Colors.green.shade50,
      ),
      value: _cropType,
      items: _cropTypes.map((type) {
        return DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _cropType = value!;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'ফসলের ধরন নির্বাচন করুন';
        }
        return null;
      },
    );
  }

  Widget _buildFertilizerLevelDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "বর্তমান সারের মাত্রা",
        labelStyle: TextStyle(color: Colors.green.shade700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green.shade500, width: 2),
        ),
        prefixIcon: Icon(Icons.insights, color: Colors.green.shade500),
        filled: true,
        fillColor: Colors.green.shade50,
      ),
      value: _currentFertilizerLevel,
      items: _fertLevels.map((level) {
        return DropdownMenuItem<String>(
          value: level,
          child: Text(level),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _currentFertilizerLevel = value!;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'সারের মাত্রা নির্বাচন করুন';
        }
        return null;
      },
    );
  }

  Widget _buildCalculateButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _isCalculating ? null : _calculateFertilizer,
        child: _isCalculating
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            : Text(
                "হিসাব করুন",
                style: TextStyle(fontSize: 16),
              ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.green.shade600,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
          shadowColor: Colors.green.shade200,
        ),
      ),
    );
  }

  Widget _buildResultsCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calculate, color: Colors.green.shade700, size: 30),
                SizedBox(width: 10),
                Text(
                  "সারের পরিমাণ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            _buildResultItem("ইউরিয়া", _results['urea'] ?? 0, "কেজি"),
            _buildResultItem("টিএসপি", _results['tsp'] ?? 0, "কেজি"),
            _buildResultItem("এমওপি", _results['mop'] ?? 0, "কেজি"),
            _buildResultItem("জিপসাম", _results['gypsum'] ?? 0, "কেজি"),
            SizedBox(height: 15),
            Text(
              "উপরের পরিমাণ ${_landArea.toStringAsFixed(1)} একর জমির জন্য প্রযোজ্য",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultItem(String name, double value, String unit) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${value.toStringAsFixed(1)} $unit",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFertilizerInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "সার সম্পর্কে তথ্যাদি",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        SizedBox(height: 10),
        _buildFertilizerInfoCard(
          "ইউরিয়া",
          "নাইট্রোজেনের প্রধান উৎস, গাছের বৃদ্ধি ও সবুজ পাতার জন্য অত্যাবশ্যকীয়",
          Colors.blue.shade50,
        ),
        _buildFertilizerInfoCard(
          "টিএসপি (ট্রিপল সুপার ফসফেট)",
          "ফসফরাসের উৎস, শিকড়ের বিকাশ ও ফুল-ফল ধারণে সহায়তা করে",
          Colors.orange.shade50,
        ),
        _buildFertilizerInfoCard(
          "এমওপি (মিউরিয়েট অফ পটাশ)",
          "পটাশিয়ামের উৎস, গাছের রোগ প্রতিরোধ ক্ষমতা বৃদ্ধি করে এবং ফলনের গুণাগুণ বজায় রাখে",
          Colors.purple.shade50,
        ),
        _buildFertilizerInfoCard(
          "জিপসাম",
          "ক্যালসিয়াম ও সালফারের উৎস, মাটির গঠন উন্নত করে এবং কিছু নির্দিষ্ট পুষ্টির প্রাপ্যতা বাড়ায়",
          Colors.teal.shade50,
        ),
      ],
    );
  }

  Widget _buildFertilizerInfoCard(String name, String info, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green.shade900,
              ),
            ),
            SizedBox(height: 5),
            Text(
              info,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateFertilizer() async {
    if (!_formKey.currentState!.validate()) return;
    
    _formKey.currentState!.save();
    
    setState(() {
      _isCalculating = true;
      _results = {};
    });
    
    // Simulate calculation delay
    await Future.delayed(Duration(seconds: 1));
    
    // Calculation logic based on inputs
    double baseUrea = 10;
    double baseTsp = 5;
    double baseMop = 3;
    double baseGypsum = 2;
    
    // Adjust based on land area
    double urea = baseUrea * _landArea;
    double tsp = baseTsp * _landArea;
    double mop = baseMop * _landArea;
    double gypsum = baseGypsum * _landArea;
    
    // Adjust based on soil type
    switch (_soilType) {
      case 'এটেল':
        urea *= 0.9;
        tsp *= 1.1;
        break;
      case 'বেলে':
        urea *= 1.2;
        tsp *= 0.8;
        mop *= 1.1;
        break;
      case 'পলি':
        urea *= 1.0;
        tsp *= 1.0;
        break;
      case 'পিট':
        urea *= 0.8;
        tsp *= 1.2;
        mop *= 0.9;
        break;
      default: // দোআঁশ
        break;
    }
    
    // Adjust based on crop type
    switch (_cropType) {
      case 'ধান':
        urea *= 1.2;
        tsp *= 0.9;
        break;
      case 'গম':
        urea *= 1.0;
        tsp *= 1.1;
        break;
      case 'ভুট্টা':
        urea *= 1.1;
        tsp *= 1.0;
        mop *= 1.1;
        break;
      case 'আলু':
        urea *= 0.9;
        tsp *= 1.2;
        mop *= 1.2;
        break;
      case 'শাকসবজি':
        urea *= 1.0;
        tsp *= 1.0;
        mop *= 1.0;
        break;
      case 'ফল':
        urea *= 0.8;
        tsp *= 1.1;
        mop *= 1.3;
        break;
    }
    
    // Adjust based on current fertilizer level
    switch (_currentFertilizerLevel) {
      case 'নিম্ন':
        urea *= 1.2;
        tsp *= 1.2;
        mop *= 1.2;
        break;
      case 'উচ্চ':
        urea *= 0.8;
        tsp *= 0.8;
        mop *= 0.8;
        break;
      default: // মধ্যম
        break;
    }
    
    setState(() {
      _results = {
        'urea': urea,
        'tsp': tsp,
        'mop': mop,
        'gypsum': gypsum,
      };
      _isCalculating = false;
    });
  }
}
