import 'package:flutter/material.dart';

class AgricultureOfficerPage extends StatefulWidget {
  const AgricultureOfficerPage({Key? key}) : super(key: key);

  @override
  _AgricultureOfficerPageState createState() => _AgricultureOfficerPageState();
}

class _AgricultureOfficerPageState extends State<AgricultureOfficerPage> {
  // Initial full list of officers
  final List<Map<String, dynamic>> _officers = [
   
    {
      'name': 'সাবিনা ইয়াসমিন',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'চাঁপাইনবাবগঞ্জ',
      'phone': '০১৭১২৩৪৫৬৭৮',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'ফল চাষ',
    },
    {
      'name': 'মো. শহিদুল ইসলাম',
      'designation': 'উপ-সহকারী কৃষি কর্মকর্তা',
      'district': 'পাবনা',
      'phone': '০১৮১২৩৪৫৬৭৮',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'বীজ উৎপাদন',
    },
    {
      'name': 'রুমানা আক্তার',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'সিরাজগঞ্জ',
      'phone': '০১৯১২৩৪৫৬৭৮',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'সবজি চাষ',
    },
    {
      'name': 'মো. কামরুল হাসান',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'কুষ্টিয়া',
      'phone': '০১৭২২৩৩৪৪৫৫',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'ধান চাষ',
    },
    {
      'name': 'শাহনাজ পারভীন',
      'designation': 'উপ-কৃষি কর্মকর্তা',
      'district': 'মেহেরপুর',
      'phone': '০১৮২২৩৩৪৪৫৫',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'কৃষি প্রশিক্ষণ',
    },
    {
      'name': 'মো. আব্দুল্লাহ',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'ঝিনাইদহ',
      'phone': '০১৯২২৩৩৪৪৫৫',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'মাছ চাষ',
    },
    {
      'name': 'তানিয়া সুলতানা',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'মাগুরা',
      'phone': '০১৭৩৩৪৪৫৫৬৬',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'ফুল চাষ',
    },
    {
      'name': 'মো. সাইফুল ইসলাম',
      'designation': 'উপ-সহকারী কৃষি কর্মকর্তা',
      'district': 'নড়াইল',
      'phone': '০১৮৩৩৪৪৫৫৬৬',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'কৃষি যন্ত্রপাতি',
    },
    {
      'name': 'শারমিন আক্তার',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'খুলনা',
      'phone': '০১৯৩৩৪৪৫৫৬৬',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'কৃষি বিপণন',
    },
    {
      'name': 'মো. রাশেদুল ইসলাম',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'বাগেরহাট',
      'phone': '০১৭৪৪৫৫৬৬৭৭',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'ফসল উৎপাদন',
    },
    {
      'name': 'নাসরিন সুলতানা',
      'designation': 'উপ-কৃষি কর্মকর্তা',
      'district': 'সাতক্ষীরা',
      'phone': '০১৮৪৪৫৫৬৬৭৭',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'কৃষি গবেষণা',
    },
    {
      'name': 'মো. জাহাঙ্গীর আলম',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'যশোর',
      'phone': '০১৯৪৪৫৫৬৬৭৭',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'কৃষি প্রযুক্তি',
    },
    {
      'name': 'রাবেয়া খাতুন',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'চুয়াডাঙ্গা',
      'phone': '০১৭৫৫৬৬৭৭৮৮',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'কৃষি অর্থনীতি',
    },
    {
      'name': 'মো. মাহবুবুর রহমান',
      'designation': 'উপ-সহকারী কৃষি কর্মকর্তা',
      'district': 'ফরিদপুর',
      'phone': '০১৮৫৫৬৬৭৭৮৮',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'কৃষি সম্প্রসারণ',
    },
    {
      'name': 'সালমা আক্তার',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'গোপালগঞ্জ',
      'phone': '০১৯৫৫৬৬৭৭৮৮',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'কৃষি প্রশিক্ষণ',
    },
    {
      'name': 'মো. রফিকুল ইসলাম',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'মাদারীপুর',
      'phone': '০১৭৬৬৭৭৮৮৯৯',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'ফসল ব্যবস্থাপনা',
    },
    {
      'name': 'শারমিন সুলতানা',
      'designation': 'উপ-কৃষি কর্মকর্তা',
      'district': 'শরীয়তপুর',
      'phone': '০১৮৬৬৭৭৮৮৯৯',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'কৃষি গবেষণা',
    },
    {
      'name': 'মো. আব্দুল কাদের',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'রাজবাড়ী',
      'phone': '০১৯৬৬৭৭৮৮৯৯',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'কৃষি প্রযুক্তি',
    },
    {
      'name': 'নাজমুল হাসান',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'টাঙ্গাইল',
      'phone': '০১৭৭৭৮৮৯৯০০',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'ফসল উৎপাদন',
    },
    {
      'name': 'রুমানা পারভীন',
      'designation': 'উপ-কৃষি কর্মকর্তা',
      'district': 'ময়মনসিংহ',
      'phone': '০১৮৭৭৮৮৯৯০০',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'কৃষি প্রশিক্ষণ',
    },
    {
      'name': 'মো. জাকির হোসেন',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'নেত্রকোনা',
      'phone': '০১৯৭৭৮৮৯৯০০',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'কৃষি সম্প্রসারণ',
    },
    {
      'name': 'শারমিন আক্তার',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'জামালপুর',
      'phone': '০১৭৮৮৯৯০০১১',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'ফসল ব্যবস্থাপনা',
    },
    {
      'name': 'মো. সাইফুল ইসলাম',
      'designation': 'উপ-সহকারী কৃষি কর্মকর্তা',
      'district': 'শেরপুর',
      'phone': '০১৮৮৮৯৯০০১১',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'কৃষি গবেষণা',
    },
    {
      'name': 'রাবেয়া সুলতানা',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'কিশোরগঞ্জ',
      'phone': '০১৯৮৮৯৯০০১১',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'কৃষি প্রযুক্তি',
    },
    {
      'name': 'মো. আব্দুল্লাহ আল মামুন',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'নরসিংদী',
      'phone': '০১৭৯৯০০১১২২',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'ফসল উৎপাদন',
    },
    {
      'name': 'শারমিন আক্তার',
      'designation': 'উপ-কৃষি কর্মকর্তা',
      'district': 'গাজীপুর',
      'phone': '০১৮৯৯০০১১২২',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'কৃষি প্রশিক্ষণ',
    },
    {
      'name': 'মো. রফিকুল ইসলাম',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'নারায়ণগঞ্জ',
      'phone': '০১৯৯৯০০১১২২',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'কৃষি সম্প্রসারণ',
    },
    {
      'name': 'নাসরিন আক্তার',
      'designation': 'কৃষি কর্মকর্তা',
      'district': 'মুন্সিগঞ্জ',
      'phone': '০১৭০০১১২২৩৩',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৯টা - বিকাল ৫টা',
      'expertise': 'ফসল ব্যবস্থাপনা',
    },
    {
      'name': 'মো. মাহবুবুর রহমান',
      'designation': 'উপ-সহকারী কৃষি কর্মকর্তা',
      'district': 'ঢাকা',
      'phone': '০১৮০০১১২২৩৩',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ১০টা - বিকাল ৪টা',
      'expertise': 'কৃষি গবেষণা',
    },
    {
      'name': 'রাবেয়া খাতুন',
      'designation': 'কৃষি সম্প্রসারণ অফিসার',
      'district': 'মানিকগঞ্জ',
      'phone': '০১৯০০১১২২৩৩',
      'image': 'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
      'availability': 'সকাল ৮টা - বিকাল ৩টা',
      'expertise': 'কৃষি প্রযুক্তি',
    },
    // Add more officers here or generate a larger list programmatically
  ];

  // Filtered officers list to display after search
  late List<Map<String, dynamic>> _filteredOfficers;

  // Controller for search text field
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initially show all officers
    _filteredOfficers = List.from(_officers);

    // Add listener for search input changes
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // Called when search input changes
  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredOfficers = _officers.where((officer) {
        final name = officer['name'].toString().toLowerCase();
        final district = officer['district'].toString().toLowerCase();
        return name.contains(query) || district.contains(query);
      }).toList();
    });
  }

  // Build officer card widget
  Widget _buildOfficerCard(BuildContext context, Map<String, dynamic> officer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showOfficerDetails(context, officer),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Officer Image Circle
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal[50],
                  image: DecorationImage(
                    image: AssetImage(officer['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Officer Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      officer['name'],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${officer['designation']}, ${officer['district']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          officer['availability'],
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Call Icon Button
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.phone, color: Colors.teal),
                ),
                onPressed: () => _makePhoneCall(context, officer['phone']),
                tooltip: 'কল করুন',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Phone call confirmation dialog (simulated)
  void _makePhoneCall(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ফোন কল করুন'),
        content: Text('আপনি কি $phoneNumber নম্বরে কল করতে চান?'),
        actions: [
          TextButton(
            child: const Text('বাতিল'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('কল করুন', style: TextStyle(color: Colors.teal)),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('কলিং $phoneNumber...'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              // TODO: Integrate `url_launcher` plugin for real calling.
            },
          ),
        ],
      ),
    );
  }

  // Show detailed officer info in bottom sheet
  void _showOfficerDetails(BuildContext context, Map<String, dynamic> officer) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 100,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal[50],
                      image: DecorationImage(
                        image: AssetImage(officer['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          officer['name'],
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          officer['designation'],
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          officer['district'],
                          style: const TextStyle(
                              fontSize: 16, color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildDetailRow(Icons.phone, 'ফোন নম্বর', officer['phone']),
              _buildDetailRow(Icons.access_time, 'অভিযোগ গ্রহণের সময়',
                  officer['availability']),
              _buildDetailRow(Icons.star, 'বিশেষজ্ঞতা', officer['expertise']),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('বন্ধ করুন'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _makePhoneCall(context, officer['phone']);
                      },
                      child: const Text('কল করুন'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Detail row widget for bottom sheet
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Colors.teal),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Dismiss keyboard when tapping outside input
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text(
            "কৃষি অফিসারদের তালিকা",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Optional: Focus the search input or scroll to it
                FocusScope.of(context).requestFocus(FocusNode());
              },
              tooltip: 'খুঁজুন',
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Search Input Field
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'জেলা বা নাম দিয়ে খুঁজুন...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  ),
                  textInputAction: TextInputAction.search,
                ),
              ),

              // Display filtered officers or empty message
              Expanded(
                child: _filteredOfficers.isEmpty
                    ? Center(
                        child: Text(
                          'কোন অফিসার পাওয়া যায়নি',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _filteredOfficers.length,
                        itemBuilder: (context, index) =>
                            _buildOfficerCard(context, _filteredOfficers[index]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
