import 'package:flutter/material.dart';

class DiseaseDetectionPage extends StatelessWidget {
  // Updated color palette for light theme
  static const Color primaryBlue = Color(0xFF2962FF);
  static const Color primaryPink = Color(0xFFD500F9);
  static const Color primaryGreen = Color(0xFF00C853);
  static const Color bgColor = Color(0xFFFFFFFF);
  static const Color cardBg = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding( 
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              _buildHeader(),
              SizedBox(height: 32),
              _buildImageUploadCard(context),
              SizedBox(height: 40),
              _buildSectionTitle("সাম্প্রতিক স্ক্যান", Icons.history_rounded),
              SizedBox(height: 16),
              _buildRecentScans(),
              SizedBox(height: 40),
              _buildSectionTitle("ডিটেকশন টিপস", Icons.lightbulb_outline_rounded),
              SizedBox(height: 16),
              _buildTipsGrid(context),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "ফসলের রোগ নির্ণয়",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: primaryBlue,
          letterSpacing: 1.1,
        ),
      ),
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryBlue.withOpacity(0.3), width: 1.5),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 26, color: primaryBlue),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryPink.withOpacity(0.3), width: 1.5),
          ),
          child: IconButton(
            icon: Icon(Icons.notifications_none_rounded, size: 26, color: primaryPink),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ফসলের রোগ সনাক্ত করুন",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: textPrimary,
            height: 1.2,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "এআই-চালিত রোগ নির্ণয়ের জন্য আক্রান্ত ফসলের স্পষ্ট ছবি আপলোড করুন",
          style: TextStyle(
            fontSize: 16,
            color: textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildImageUploadCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cardBg,
        border: Border.all(
          width: 1.5,
          color: Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.5,
            color: primaryBlue.withOpacity(0.3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [primaryBlue.withOpacity(0.1), primaryGreen.withOpacity(0.1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: primaryBlue.withOpacity(0.5), width: 1.5),
                ),
                child: Center(
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 36,
                    color: primaryBlue,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "ফসলের ছবি আপলোড করুন",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "সেরা ফলাফলের জন্য, আক্রান্ত পাতা বা ফলের স্পষ্ট ছবি তুলুন",
                style: TextStyle(
                  fontSize: 14,
                  color: textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildUploadButton(
                      icon: Icons.photo_library_rounded,
                      label: "গ্যালারি",
                      isOutline: true,
                      color: primaryPink,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildUploadButton(
                      icon: Icons.camera_alt_rounded,
                      label: "ক্যামেরা",
                      isOutline: false,
                      color: primaryBlue,
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

  Widget _buildUploadButton({
    required IconData icon,
    required String label,
    required bool isOutline,
    required Color color,
  }) {
    return Container(
      height: 48,
      decoration: isOutline
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color, width: 1.5),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                )
              ],
            ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isOutline ? color : Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: isOutline ? color : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [primaryBlue, primaryGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: textPrimary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentScans() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildScanItem("ধান ঝলসা রোগ", Icons.grass_rounded, "২ দিন আগে", primaryBlue),
          _buildScanItem("টমেটো উইল্ট", Icons.local_florist_rounded, "১ সপ্তাহ আগে", primaryPink),
          _buildScanItem("আলুর ব্লাইট", Icons.eco_rounded, "৩ দিন আগে", primaryGreen),
          _buildScanItem("গমের রস্ট", Icons.spa_rounded, "৫ দিন আগে", primaryBlue),
          _buildScanItem("বেগুনের পাতার দাগ", Icons.filter_vintage_rounded, "৪ দিন আগে", primaryPink),
          _buildScanItem("মরিচের ভাইরাস", Icons.bug_report_rounded, "১ দিন আগে", primaryGreen),
          _buildScanItem("পেঁয়াজের পচন", Icons.opacity_rounded, "২ সপ্তাহ আগে", primaryBlue),
        ],
      ),
    );
  }

  Widget _buildScanItem(String disease, IconData icon, String time, Color color) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withOpacity(0.3), width: 1.5),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 28,
                  color: color,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              disease,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: textPrimary,
              ),
            ),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                color: textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipsGrid(BuildContext context) {
    // Responsive: 3 per row on wide, 2 per row on medium, 1 per row on narrow
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = 3;
    if (width < 500) {
      crossAxisCount = 1;
    } else if (width < 800) {
      crossAxisCount = 2;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.95,
          padding: const EdgeInsets.only(bottom: 32),
          children: [
            _buildTipCard(Icons.wb_sunny_rounded, "প্রাকৃতিক আলো", primaryBlue),
            _buildTipCard(Icons.zoom_in_rounded, "ক্লোজ-আপ", primaryPink),
            _buildTipCard(Icons.crop_free_rounded, "বিভিন্ন কোণ", primaryGreen),
            _buildTipCard(Icons.filter_rounded, "পরিষ্কার ব্যাকগ্রাউন্ড", primaryBlue),
          ],
        );
      },
    );
  }

  Widget _buildTipCard(IconData icon, String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withOpacity(0.3), width: 1.5),
            ),
            child: Icon(
              icon,
              size: 20,
              color: color,
            ),
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: textPrimary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            _getTipDescription(title),
            style: TextStyle(
              fontSize: 13,
              color: textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  String _getTipDescription(String title) {
    switch (title) {
      case "প্রাকৃতিক আলো":
        return "সঠিক রং পেতে দিনের আলো ব্যবহার করুন";
      case "ক্লোজ-আপ":
        return "আক্রান্ত স্থানের স্পষ্ট ছবি তুলুন";
      case "বিভিন্ন কোণ":
        return "বিভিন্ন দিক থেকে ছবি তুলুন";
      case "পরিষ্কার ব্যাকগ্রাউন্ড":
        return "অপ্রয়োজনীয় জিনিস এড়িয়ে চলুন";
      default:
        return "";
    }
  }
}
