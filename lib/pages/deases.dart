import 'package:flutter/material.dart';

// Entry point widget
class PestsDiseasesPage extends StatefulWidget {
  @override
  _PestsDiseasesPageState createState() => _PestsDiseasesPageState();
}

class _PestsDiseasesPageState extends State<PestsDiseasesPage> {
  final List<Map<String, dynamic>> pests = [
    {
      'name': 'পোকা মাকড়',
      'description': 'ধান ক্ষেতের বিভিন্ন পোকা মাকড় সম্পর্কে বিস্তারিত তথ্য এবং কীভাবে প্রতিকার করবেন।',
      'image': 'https://i.postimg.cc/bJDQXzQq/2-bph1.jpg',
      'details':
          'ধান ক্ষেতের বিভিন্ন ধরনের পোকা মাকড় যেমন তরমুজ পোকা, তেতু পোকা, প্রভৃতি। এগুলো কীভাবে ফসলের ক্ষতি করে এবং কীভাবে নিয়ন্ত্রণ করবেন তা এখানে বিস্তারিত ভাবে আলোচনা করা হয়েছে।',
    },
     {
    'name': 'ফসলের রোগ',
    'description': 'ধান, গম ও অন্যান্য ফসলের সাধারণ রোগ এবং তাদের উপশম।',
    'image': 'https://i.postimg.cc/8CCRHdcJ/22402810-4-2022-p9-3.jpg',
    'details':
        'ধানের বিভিন্ন রোগ যেমন ধান ফোঁপানো রোগ, তিলছানি রোগ, গমের ব্লাইট রোগ ইত্যাদি এবং তাদের প্রতিকার সম্পর্কে প্রয়োজনীয় তথ্য।',
  },
  {
    'name': 'সমাধান',
    'description': 'কীটনাশক ও প্রতিকার সম্পর্কে তথ্য ও সঠিক প্রয়োগ বিধি।',
    'image': 'https://i.postimg.cc/XYLKd1j6/dhaner-lomba-shur-owal-poka.jpg',
    'details':
        'কীটনাশক ব্যবহারের সঠিক নিয়ম, পরিবেশ বান্ধব উপায় এবং অর্গানিক কৃষির পদ্ধতি সম্পর্কে বিস্তারিত নির্দেশনা।',
  },
  {
    'name': 'ধানের পোকামাকড়',
    'description': 'ধান ক্ষতিকর পোকামাকড় ও তাদের জীবচক্র।',
    'image': 'https://i.postimg.cc/NM3RBW4m/download.jpg',
    'details':
        'ধান ক্ষতি করে এমন পোকামাকড় যেমন ধানপাত পোকা, চাল পোকা, ধান গুঁড়ো পোকা এবং তাদের প্রতিরোধ পদ্ধতি।',
  },
  {
    'name': 'গমের রোগ',
    'description': 'গমের প্রধান রোগ এবং প্রতিকার।',
    'image': 'https://i.postimg.cc/9fNGN4wx/images.jpg',
    'details':
        'গমের ব্লাইট, রুটি রোগ, গম পাতার দাগ রোগ ইত্যাদি এবং তাদের প্রতিরোধের উপায়।',
  },
  {
    'name': 'ফসলের পোকামাকড় নিয়ন্ত্রণ',
    'description': 'জৈব ও রাসায়নিক পদ্ধতিতে কীটনাশক ব্যবস্থাপনা।',
    'image': 'https://i.postimg.cc/2SrFqNfx/images-1.jpg',
    'details':
        'ফসলের পোকামাকড় দমন করতে পরিবেশ বান্ধব ও রাসায়নিক কীটনাশকের সঠিক প্রয়োগ পদ্ধতি।',
  },
  {
    'name': 'সবজি পোকামাকড়',
    'description': 'সবজির ক্ষতিকর পোকামাকড় এবং প্রতিকার।',
    'image': 'https://i.postimg.cc/3JgFJJzR/images-2.jpg',
    'details':
        'টমেটো, বেগুন, মরিচের পোকামাকড় যেমন টমেটো ওয়ার্ম, বেগুন পোকা এবং কীভাবে নিয়ন্ত্রণ করবেন।',
  },
  {
    'name': 'ফসলের ফাঙ্গাস রোগ',
    'description': 'ফাঙ্গাস দ্বারা সৃষ্ট ফসলের রোগ এবং তাদের প্রতিকার।',
    'image': 'https://i.postimg.cc/KvX52gqw/images-3.jpg',
    'details':
        'ফাঙ্গাসের কারণে সৃষ্ট ফসলের রোগ যেমন পাউডারি মিলডিউ, ব্লাইট, রুট রট ইত্যাদি এবং তাদের প্রতিকার।',
  },
  {
    'name': 'কীটনাশকের নিরাপদ ব্যবহার',
    'description': 'কীটনাশকের সঠিক ডোজ ও প্রয়োগ পদ্ধতি।',
    'image': 'https://i.postimg.cc/bJDQXzQq/2-bph1.jpg',
    'details':
        'কীটনাশকের নিরাপদ ব্যবহার, ডোজ ও সময়মত প্রয়োগের গুরুত্ব এবং পরিবেশ রক্ষা।',
  },
  {
    'name': 'ধানের পোকামাকড়ের জীববিজ্ঞান',
    'description': 'ধানের ক্ষতিকর পোকামাকড়ের জীবনচক্র।',
    'image': 'https://i.postimg.cc/8CCRHdcJ/22402810-4-2022-p9-3.jpg',
    'details':
        'ধানের পোকামাকড়ের জীবনচক্র এবং তাদের দুর্বল সময়ের উপর ভিত্তি করে দমন কৌশল।',
  },
  {
    'name': 'ফসলের ভাইরাস রোগ',
    'description': 'ভাইরাসজনিত রোগ ও প্রতিকার।',
    'image': 'https://i.postimg.cc/XYLKd1j6/dhaner-lomba-shur-owal-poka.jpg',
    'details':
        'ধান, গম ও অন্যান্য ফসলের ভাইরাসজনিত রোগ যেমন ধানের স্টিকি রোগ, পিঙ্ক ব্লাস্ট এবং তাদের প্রতিরোধ।',
  },
  {
    'name': 'জৈব কীটনাশক',
    'description': 'জৈব কীটনাশকের ব্যবহার ও সুবিধা।',
    'image': 'https://i.postimg.cc/NM3RBW4m/download.jpg',
    'details':
        'জৈব কীটনাশকের প্রকারভেদ, সুবিধা এবং পরিবেশবান্ধব কৃষির জন্য তাদের প্রয়োগ পদ্ধতি।',
  },
  {
    'name': 'গমের পোকামাকড়',
    'description': 'গমের ক্ষতিকর পোকামাকড় এবং তাদের নিয়ন্ত্রণ।',
    'image': 'https://i.postimg.cc/9fNGN4wx/images.jpg',
    'details':
        'গম ক্ষতিকর পোকামাকড় যেমন গম পোকা, গম ডাঠ পোকা এবং তাদের প্রতিরোধ পদ্ধতি।',
  },
  {
    'name': 'ধানের ব্যাকটেরিয়া রোগ',
    'description': 'ধানের ব্যাকটেরিয়া জনিত রোগ ও প্রতিকার।',
    'image': 'https://i.postimg.cc/2SrFqNfx/images-1.jpg',
    'details':
        'ধানের ব্যাকটেরিয়া জনিত রোগ যেমন ধানের পাতা পচন এবং তাদের প্রতিকার পদ্ধতি।',
  },
  {
    'name': 'কীটনাশকের সঠিক সংরক্ষণ',
    'description': 'কীটনাশকের সঠিক স্টোরেজ ও নিরাপত্তা।',
    'image': 'https://i.postimg.cc/3JgFJJzR/images-2.jpg',
    'details':
        'কীটনাশক সংরক্ষণের সঠিক পদ্ধতি ও নিরাপত্তা বিধান।',
  },
  {
    'name': 'সবজির পোকামাকড়ের জীবনচক্র',
    'description': 'সবজির ক্ষতিকর পোকামাকড়ের জীবনচক্র ও নিয়ন্ত্রণ।',
    'image': 'https://i.postimg.cc/KvX52gqw/images-3.jpg',
    'details':
        'সবজির পোকামাকড়ের জীবনচক্র বিশ্লেষণ এবং কার্যকর নিয়ন্ত্রণ কৌশল।',
  },
  {
    'name': 'ফসলের পেস্ট ও রোগ পরস্পরের প্রভাব',
    'description': 'পোকামাকড় ও রোগের সম্পর্ক এবং যৌথ প্রতিকার।',
    'image': 'https://i.postimg.cc/bJDQXzQq/2-bph1.jpg',
    'details':
        'কীভাবে পোকামাকড় ও রোগ একসাথে ফসলের ক্ষতি করে এবং তাদের প্রতিকার পদ্ধতি।',
  },
  {
    'name': 'অর্গানিক কীটনাশক',
    'description': 'অর্গানিক কীটনাশকের প্রস্তুতি ও প্রয়োগ।',
    'image': 'https://i.postimg.cc/8CCRHdcJ/22402810-4-2022-p9-3.jpg',
    'details':
        'অর্গানিক কীটনাশক তৈরির পদ্ধতি এবং পরিবেশবান্ধব কৃষির জন্য তাদের প্রয়োগ বিধি।',
  },
  {
    'name': 'ধানের পোকামাকড়ের ক্ষতি ও উপশম',
    'description': 'ধানের ক্ষতিকর পোকামাকড় এবং তাদের প্রতিকার পদ্ধতি।',
    'image': 'https://i.postimg.cc/XYLKd1j6/dhaner-lomba-shur-owal-poka.jpg',
    'details':
        'ধানের ক্ষতিকর পোকামাকড়ের প্রকারভেদ, তাদের ক্ষতির ধরন এবং কার্যকর উপশম।',
  },
  {
    'name': 'গমের রোগ প্রতিরোধ ব্যবস্থা',
    'description': 'গমের রোগ প্রতিরোধে বীজ ও ফসল পরিচর্যার গুরুত্ব।',
    'image': 'https://i.postimg.cc/NM3RBW4m/download.jpg',
    'details':
        'গমের রোগ প্রতিরোধে স্বাস্থ্যকর বীজ নির্বাচন ও ফসল পরিচর্যার সঠিক পদ্ধতি।',
  },
  {
    'name': 'কীটনাশক প্রয়োগের সময় ও পদ্ধতি',
    'description': 'কীটনাশক প্রয়োগের সঠিক সময় ও কৌশল।',
    'image': 'https://i.postimg.cc/9fNGN4wx/images.jpg',
    'details':
        'কীটনাশক প্রয়োগের জন্য সঠিক সময় নির্বাচন এবং কার্যকর কৌশল।',
  },
  {
    'name': 'সবজির রোগ ও কীটনাশক ব্যবস্থাপনা',
    'description': 'সবজির রোগ ও কীটনাশকের সঠিক ব্যবস্থাপনা।',
    'image': 'https://i.postimg.cc/2SrFqNfx/images-1.jpg',
    'details':
        'সবজির রোগ শনাক্তকরণ এবং কীটনাশকের সঠিক প্রয়োগ বিধি।',
  },
  {
    'name': 'জৈব পদ্ধতিতে কীটনাশক ব্যবস্থাপনা',
    'description': 'জৈব পদ্ধতিতে কীটনাশকের ব্যবহার ও সুবিধা।',
    'image': 'https://i.postimg.cc/3JgFJJzR/images-2.jpg',
    'details':
        'জৈব কীটনাশক ব্যবস্থাপনা ও এর পরিবেশগত উপকারিতা।',
  },
  {
    'name': 'ফসলের রোগ ও ক্ষতিকর পোকামাকড়ের প্রতিকার',
    'description': 'ফসলের রোগ ও পোকামাকড়ের যৌথ প্রতিকার পদ্ধতি।',
    'image': 'https://i.postimg.cc/KvX52gqw/images-3.jpg',
    'details':
        'ফসলের রোগ ও পোকামাকড় একসাথে কিভাবে নিয়ন্ত্রণ করবেন তার বিস্তারিত।',
  },
   {
    'name': 'ফসলের রোগ',
    'description': 'ধান, গম ও অন্যান্য ফসলের সাধারণ রোগ এবং তাদের উপশম।',
    'image': 'https://i.postimg.cc/8CCRHdcJ/22402810-4-2022-p9-3.jpg',
    'details':
        'ধানের বিভিন্ন রোগ যেমন ধান ফোঁপানো রোগ, তিলছানি রোগ, গমের ব্লাইট রোগ ইত্যাদি এবং তাদের প্রতিকার সম্পর্কে প্রয়োজনীয় তথ্য।',
  },
  {
    'name': 'সমাধান',
    'description': 'কীটনাশক ও প্রতিকার সম্পর্কে তথ্য ও সঠিক প্রয়োগ বিধি।',
    'image': 'https://i.postimg.cc/XYLKd1j6/dhaner-lomba-shur-owal-poka.jpg',
    'details':
        'কীটনাশক ব্যবহারের সঠিক নিয়ম, পরিবেশ বান্ধব উপায় এবং অর্গানিক কৃষির পদ্ধতি সম্পর্কে বিস্তারিত নির্দেশনা।',
  },
  {
    'name': 'ধানের পোকামাকড়',
    'description': 'ধান ক্ষতিকর পোকামাকড় ও তাদের জীবচক্র।',
    'image': 'https://i.postimg.cc/NM3RBW4m/download.jpg',
    'details':
        'ধান ক্ষতি করে এমন পোকামাকড় যেমন ধানপাত পোকা, চাল পোকা, ধান গুঁড়ো পোকা এবং তাদের প্রতিরোধ পদ্ধতি।',
  },
  {
    'name': 'গমের রোগ',
    'description': 'গমের প্রধান রোগ এবং প্রতিকার।',
    'image': 'https://i.postimg.cc/9fNGN4wx/images.jpg',
    'details':
        'গমের ব্লাইট, রুটি রোগ, গম পাতার দাগ রোগ ইত্যাদি এবং তাদের প্রতিরোধের উপায়।',
  },
  {
    'name': 'ফসলের পোকামাকড় নিয়ন্ত্রণ',
    'description': 'জৈব ও রাসায়নিক পদ্ধতিতে কীটনাশক ব্যবস্থাপনা।',
    'image': 'https://i.postimg.cc/2SrFqNfx/images-1.jpg',
    'details':
        'ফসলের পোকামাকড় দমন করতে পরিবেশ বান্ধব ও রাসায়নিক কীটনাশকের সঠিক প্রয়োগ পদ্ধতি।',
  },
  {
    'name': 'সবজি পোকামাকড়',
    'description': 'সবজির ক্ষতিকর পোকামাকড় এবং প্রতিকার।',
    'image': 'https://i.postimg.cc/3JgFJJzR/images-2.jpg',
    'details':
        'টমেটো, বেগুন, মরিচের পোকামাকড় যেমন টমেটো ওয়ার্ম, বেগুন পোকা এবং কীভাবে নিয়ন্ত্রণ করবেন।',
  },
  {
    'name': 'ফসলের ফাঙ্গাস রোগ',
    'description': 'ফাঙ্গাস দ্বারা সৃষ্ট ফসলের রোগ এবং তাদের প্রতিকার।',
    'image': 'https://i.postimg.cc/KvX52gqw/images-3.jpg',
    'details':
        'ফাঙ্গাসের কারণে সৃষ্ট ফসলের রোগ যেমন পাউডারি মিলডিউ, ব্লাইট, রুট রট ইত্যাদি এবং তাদের প্রতিকার।',
  },
  {
    'name': 'কীটনাশকের নিরাপদ ব্যবহার',
    'description': 'কীটনাশকের সঠিক ডোজ ও প্রয়োগ পদ্ধতি।',
    'image': 'https://i.postimg.cc/bJDQXzQq/2-bph1.jpg',
    'details':
        'কীটনাশকের নিরাপদ ব্যবহার, ডোজ ও সময়মত প্রয়োগের গুরুত্ব এবং পরিবেশ রক্ষা।',
  },
  {
    'name': 'ধানের পোকামাকড়ের জীববিজ্ঞান',
    'description': 'ধানের ক্ষতিকর পোকামাকড়ের জীবনচক্র।',
    'image': 'https://i.postimg.cc/8CCRHdcJ/22402810-4-2022-p9-3.jpg',
    'details':
        'ধানের পোকামাকড়ের জীবনচক্র এবং তাদের দুর্বল সময়ের উপর ভিত্তি করে দমন কৌশল।',
  },
  {
    'name': 'ফসলের ভাইরাস রোগ',
    'description': 'ভাইরাসজনিত রোগ ও প্রতিকার।',
    'image': 'https://i.postimg.cc/XYLKd1j6/dhaner-lomba-shur-owal-poka.jpg',
    'details':
        'ধান, গম ও অন্যান্য ফসলের ভাইরাসজনিত রোগ যেমন ধানের স্টিকি রোগ, পিঙ্ক ব্লাস্ট এবং তাদের প্রতিরোধ।',
  },
  {
    'name': 'জৈব কীটনাশক',
    'description': 'জৈব কীটনাশকের ব্যবহার ও সুবিধা।',
    'image': 'https://i.postimg.cc/NM3RBW4m/download.jpg',
    'details':
        'জৈব কীটনাশকের প্রকারভেদ, সুবিধা এবং পরিবেশবান্ধব কৃষির জন্য তাদের প্রয়োগ পদ্ধতি।',
  },
  {
    'name': 'গমের পোকামাকড়',
    'description': 'গমের ক্ষতিকর পোকামাকড় এবং তাদের নিয়ন্ত্রণ।',
    'image': 'https://i.postimg.cc/9fNGN4wx/images.jpg',
    'details':
        'গম ক্ষতিকর পোকামাকড় যেমন গম পোকা, গম ডাঠ পোকা এবং তাদের প্রতিরোধ পদ্ধতি।',
  },
  {
    'name': 'ধানের ব্যাকটেরিয়া রোগ',
    'description': 'ধানের ব্যাকটেরিয়া জনিত রোগ ও প্রতিকার।',
    'image': 'https://i.postimg.cc/2SrFqNfx/images-1.jpg',
    'details':
        'ধানের ব্যাকটেরিয়া জনিত রোগ যেমন ধানের পাতা পচন এবং তাদের প্রতিকার পদ্ধতি।',
  },
  {
    'name': 'কীটনাশকের সঠিক সংরক্ষণ',
    'description': 'কীটনাশকের সঠিক স্টোরেজ ও নিরাপত্তা।',
    'image': 'https://i.postimg.cc/3JgFJJzR/images-2.jpg',
    'details':
        'কীটনাশক সংরক্ষণের সঠিক পদ্ধতি ও নিরাপত্তা বিধান।',
  },
  {
    'name': 'সবজির পোকামাকড়ের জীবনচক্র',
    'description': 'সবজির ক্ষতিকর পোকামাকড়ের জীবনচক্র ও নিয়ন্ত্রণ।',
    'image': 'https://i.postimg.cc/KvX52gqw/images-3.jpg',
    'details':
        'সবজির পোকামাকড়ের জীবনচক্র বিশ্লেষণ এবং কার্যকর নিয়ন্ত্রণ কৌশল।',
  },
  {
    'name': 'ফসলের পেস্ট ও রোগ পরস্পরের প্রভাব',
    'description': 'পোকামাকড় ও রোগের সম্পর্ক এবং যৌথ প্রতিকার।',
    'image': 'https://i.postimg.cc/bJDQXzQq/2-bph1.jpg',
    'details':
        'কীভাবে পোকামাকড় ও রোগ একসাথে ফসলের ক্ষতি করে এবং তাদের প্রতিকার পদ্ধতি।',
  },
  {
    'name': 'অর্গানিক কীটনাশক',
    'description': 'অর্গানিক কীটনাশকের প্রস্তুতি ও প্রয়োগ।',
    'image': 'https://i.postimg.cc/8CCRHdcJ/22402810-4-2022-p9-3.jpg',
    'details':
        'অর্গানিক কীটনাশক তৈরির পদ্ধতি এবং পরিবেশবান্ধব কৃষির জন্য তাদের প্রয়োগ বিধি।',
  },
  {
    'name': 'ধানের পোকামাকড়ের ক্ষতি ও উপশম',
    'description': 'ধানের ক্ষতিকর পোকামাকড় এবং তাদের প্রতিকার পদ্ধতি।',
    'image': 'https://i.postimg.cc/XYLKd1j6/dhaner-lomba-shur-owal-poka.jpg',
    'details':
        'ধানের ক্ষতিকর পোকামাকড়ের প্রকারভেদ, তাদের ক্ষতির ধরন এবং কার্যকর উপশম।',
  },
  {
    'name': 'গমের রোগ প্রতিরোধ ব্যবস্থা',
    'description': 'গমের রোগ প্রতিরোধে বীজ ও ফসল পরিচর্যার গুরুত্ব।',
    'image': 'https://i.postimg.cc/NM3RBW4m/download.jpg',
    'details':
        'গমের রোগ প্রতিরোধে স্বাস্থ্যকর বীজ নির্বাচন ও ফসল পরিচর্যার সঠিক পদ্ধতি।',
  },
  {
    'name': 'কীটনাশক প্রয়োগের সময় ও পদ্ধতি',
    'description': 'কীটনাশক প্রয়োগের সঠিক সময় ও কৌশল।',
    'image': 'https://i.postimg.cc/9fNGN4wx/images.jpg',
    'details':
        'কীটনাশক প্রয়োগের জন্য সঠিক সময় নির্বাচন এবং কার্যকর কৌশল।',
  },
  {
    'name': 'সবজির রোগ ও কীটনাশক ব্যবস্থাপনা',
    'description': 'সবজির রোগ ও কীটনাশকের সঠিক ব্যবস্থাপনা।',
    'image': 'https://i.postimg.cc/2SrFqNfx/images-1.jpg',
    'details':
        'সবজির রোগ শনাক্তকরণ এবং কীটনাশকের সঠিক প্রয়োগ বিধি।',
  },
  {
    'name': 'জৈব পদ্ধতিতে কীটনাশক ব্যবস্থাপনা',
    'description': 'জৈব পদ্ধতিতে কীটনাশকের ব্যবহার ও সুবিধা।',
    'image': 'https://i.postimg.cc/3JgFJJzR/images-2.jpg',
    'details':
        'জৈব কীটনাশক ব্যবস্থাপনা ও এর পরিবেশগত উপকারিতা।',
  },
  {
    'name': 'ফসলের রোগ ও ক্ষতিকর পোকামাকড়ের প্রতিকার',
    'description': 'ফসলের রোগ ও পোকামাকড়ের যৌথ প্রতিকার পদ্ধতি।',
    'image': 'https://i.postimg.cc/KvX52gqw/images-3.jpg',
    'details':
        'ফসলের রোগ ও পোকামাকড় একসাথে কিভাবে নিয়ন্ত্রণ করবেন তার বিস্তারিত।',
  },
   {
    'name': 'ফসলের রোগ',
    'description': 'ধান, গম ও অন্যান্য ফসলের সাধারণ রোগ এবং তাদের উপশম।',
    'image': 'https://i.postimg.cc/8CCRHdcJ/22402810-4-2022-p9-3.jpg',
    'details':
        'ধানের বিভিন্ন রোগ যেমন ধান ফোঁপানো রোগ, তিলছানি রোগ, গমের ব্লাইট রোগ ইত্যাদি এবং তাদের প্রতিকার সম্পর্কে প্রয়োজনীয় তথ্য।',
  },
  {
    'name': 'সমাধান',
    'description': 'কীটনাশক ও প্রতিকার সম্পর্কে তথ্য ও সঠিক প্রয়োগ বিধি।',
    'image': 'https://i.postimg.cc/XYLKd1j6/dhaner-lomba-shur-owal-poka.jpg',
    'details':
        'কীটনাশক ব্যবহারের সঠিক নিয়ম, পরিবেশ বান্ধব উপায় এবং অর্গানিক কৃষির পদ্ধতি সম্পর্কে বিস্তারিত নির্দেশনা।',
  },
  {
    'name': 'ধানের পোকামাকড়',
    'description': 'ধান ক্ষতিকর পোকামাকড় ও তাদের জীবচক্র।',
    'image': 'https://i.postimg.cc/NM3RBW4m/download.jpg',
    'details':
        'ধান ক্ষতি করে এমন পোকামাকড় যেমন ধানপাত পোকা, চাল পোকা, ধান গুঁড়ো পোকা এবং তাদের প্রতিরোধ পদ্ধতি।',
  },
  {
    'name': 'গমের রোগ',
    'description': 'গমের প্রধান রোগ এবং প্রতিকার।',
    'image': 'https://i.postimg.cc/9fNGN4wx/images.jpg',
    'details':
        'গমের ব্লাইট, রুটি রোগ, গম পাতার দাগ রোগ ইত্যাদি এবং তাদের প্রতিরোধের উপায়।',
  },
  {
    'name': 'ফসলের পোকামাকড় নিয়ন্ত্রণ',
    'description': 'জৈব ও রাসায়নিক পদ্ধতিতে কীটনাশক ব্যবস্থাপনা।',
    'image': 'https://i.postimg.cc/2SrFqNfx/images-1.jpg',
    'details':
        'ফসলের পোকামাকড় দমন করতে পরিবেশ বান্ধব ও রাসায়নিক কীটনাশকের সঠিক প্রয়োগ পদ্ধতি।',
  },
  {
    'name': 'সবজি পোকামাকড়',
    'description': 'সবজির ক্ষতিকর পোকামাকড় এবং প্রতিকার।',
    'image': 'https://i.postimg.cc/3JgFJJzR/images-2.jpg',
    'details':
        'টমেটো, বেগুন, মরিচের পোকামাকড় যেমন টমেটো ওয়ার্ম, বেগুন পোকা এবং কীভাবে নিয়ন্ত্রণ করবেন।',
  },
  {
    'name': 'ফসলের ফাঙ্গাস রোগ',
    'description': 'ফাঙ্গাস দ্বারা সৃষ্ট ফসলের রোগ এবং তাদের প্রতিকার।',
    'image': 'https://i.postimg.cc/KvX52gqw/images-3.jpg',
    'details':
        'ফাঙ্গাসের কারণে সৃষ্ট ফসলের রোগ যেমন পাউডারি মিলডিউ, ব্লাইট, রুট রট ইত্যাদি এবং তাদের প্রতিকার।',
  },
  {
    'name': 'কীটনাশকের নিরাপদ ব্যবহার',
    'description': 'কীটনাশকের সঠিক ডোজ ও প্রয়োগ পদ্ধতি।',
    'image': 'https://i.postimg.cc/bJDQXzQq/2-bph1.jpg',
    'details':
        'কীটনাশকের নিরাপদ ব্যবহার, ডোজ ও সময়মত প্রয়োগের গুরুত্ব এবং পরিবেশ রক্ষা।',
  },
  {
    'name': 'ধানের পোকামাকড়ের জীববিজ্ঞান',
    'description': 'ধানের ক্ষতিকর পোকামাকড়ের জীবনচক্র।',
    'image': 'https://i.postimg.cc/8CCRHdcJ/22402810-4-2022-p9-3.jpg',
    'details':
        'ধানের পোকামাকড়ের জীবনচক্র এবং তাদের দুর্বল সময়ের উপর ভিত্তি করে দমন কৌশল।',
  },
  {
    'name': 'ফসলের ভাইরাস রোগ',
    'description': 'ভাইরাসজনিত রোগ ও প্রতিকার।',
    'image': 'https://i.postimg.cc/XYLKd1j6/dhaner-lomba-shur-owal-poka.jpg',
    'details':
        'ধান, গম ও অন্যান্য ফসলের ভাইরাসজনিত রোগ যেমন ধানের স্টিকি রোগ, পিঙ্ক ব্লাস্ট এবং তাদের প্রতিরোধ।',
  },
  {
    'name': 'জৈব কীটনাশক',
    'description': 'জৈব কীটনাশকের ব্যবহার ও সুবিধা।',
    'image': 'https://i.postimg.cc/NM3RBW4m/download.jpg',
    'details':
        'জৈব কীটনাশকের প্রকারভেদ, সুবিধা এবং পরিবেশবান্ধব কৃষির জন্য তাদের প্রয়োগ পদ্ধতি।',
  },
  {
    'name': 'গমের পোকামাকড়',
    'description': 'গমের ক্ষতিকর পোকামাকড় এবং তাদের নিয়ন্ত্রণ।',
    'image': 'https://i.postimg.cc/9fNGN4wx/images.jpg',
    'details':
        'গম ক্ষতিকর পোকামাকড় যেমন গম পোকা, গম ডাঠ পোকা এবং তাদের প্রতিরোধ পদ্ধতি।',
  },
  {
    'name': 'ধানের ব্যাকটেরিয়া রোগ',
    'description': 'ধানের ব্যাকটেরিয়া জনিত রোগ ও প্রতিকার।',
    'image': 'https://i.postimg.cc/2SrFqNfx/images-1.jpg',
    'details':
        'ধানের ব্যাকটেরিয়া জনিত রোগ যেমন ধানের পাতা পচন এবং তাদের প্রতিকার পদ্ধতি।',
  },
  {
    'name': 'কীটনাশকের সঠিক সংরক্ষণ',
    'description': 'কীটনাশকের সঠিক স্টোরেজ ও নিরাপত্তা।',
    'image': 'https://i.postimg.cc/3JgFJJzR/images-2.jpg',
    'details':
        'কীটনাশক সংরক্ষণের সঠিক পদ্ধতি ও নিরাপত্তা বিধান।',
  },
  {
    'name': 'সবজির পোকামাকড়ের জীবনচক্র',
    'description': 'সবজির ক্ষতিকর পোকামাকড়ের জীবনচক্র ও নিয়ন্ত্রণ।',
    'image': 'https://i.postimg.cc/KvX52gqw/images-3.jpg',
    'details':
        'সবজির পোকামাকড়ের জীবনচক্র বিশ্লেষণ এবং কার্যকর নিয়ন্ত্রণ কৌশল।',
  },
  {
    'name': 'ফসলের পেস্ট ও রোগ পরস্পরের প্রভাব',
    'description': 'পোকামাকড় ও রোগের সম্পর্ক এবং যৌথ প্রতিকার।',
    'image': 'https://i.postimg.cc/bJDQXzQq/2-bph1.jpg',
    'details':
        'কীভাবে পোকামাকড় ও রোগ একসাথে ফসলের ক্ষতি করে এবং তাদের প্রতিকার পদ্ধতি।',
  },
  {
    'name': 'অর্গানিক কীটনাশক',
    'description': 'অর্গানিক কীটনাশকের প্রস্তুতি ও প্রয়োগ।',
    'image': 'https://i.postimg.cc/8CCRHdcJ/22402810-4-2022-p9-3.jpg',
    'details':
        'অর্গানিক কীটনাশক তৈরির পদ্ধতি এবং পরিবেশবান্ধব কৃষির জন্য তাদের প্রয়োগ বিধি।',
  },
  {
    'name': 'ধানের পোকামাকড়ের ক্ষতি ও উপশম',
    'description': 'ধানের ক্ষতিকর পোকামাকড় এবং তাদের প্রতিকার পদ্ধতি।',
    'image': 'https://i.postimg.cc/XYLKd1j6/dhaner-lomba-shur-owal-poka.jpg',
    'details':
        'ধানের ক্ষতিকর পোকামাকড়ের প্রকারভেদ, তাদের ক্ষতির ধরন এবং কার্যকর উপশম।',
  },
  {
    'name': 'গমের রোগ প্রতিরোধ ব্যবস্থা',
    'description': 'গমের রোগ প্রতিরোধে বীজ ও ফসল পরিচর্যার গুরুত্ব।',
    'image': 'https://i.postimg.cc/NM3RBW4m/download.jpg',
    'details':
        'গমের রোগ প্রতিরোধে স্বাস্থ্যকর বীজ নির্বাচন ও ফসল পরিচর্যার সঠিক পদ্ধতি।',
  },
  {
    'name': 'কীটনাশক প্রয়োগের সময় ও পদ্ধতি',
    'description': 'কীটনাশক প্রয়োগের সঠিক সময় ও কৌশল।',
    'image': 'https://i.postimg.cc/9fNGN4wx/images.jpg',
    'details':
        'কীটনাশক প্রয়োগের জন্য সঠিক সময় নির্বাচন এবং কার্যকর কৌশল।',
  },
  {
    'name': 'সবজির রোগ ও কীটনাশক ব্যবস্থাপনা',
    'description': 'সবজির রোগ ও কীটনাশকের সঠিক ব্যবস্থাপনা।',
    'image': 'https://i.postimg.cc/2SrFqNfx/images-1.jpg',
    'details':
        'সবজির রোগ শনাক্তকরণ এবং কীটনাশকের সঠিক প্রয়োগ বিধি।',
  },
  {
    'name': 'জৈব পদ্ধতিতে কীটনাশক ব্যবস্থাপনা',
    'description': 'জৈব পদ্ধতিতে কীটনাশকের ব্যবহার ও সুবিধা।',
    'image': 'https://i.postimg.cc/3JgFJJzR/images-2.jpg',
    'details':
        'জৈব কীটনাশক ব্যবস্থাপনা ও এর পরিবেশগত উপকারিতা।',
  },
  {
    'name': 'ফসলের রোগ ও ক্ষতিকর পোকামাকড়ের প্রতিকার',
    'description': 'ফসলের রোগ ও পোকামাকড়ের যৌথ প্রতিকার পদ্ধতি।',
    'image': 'https://i.postimg.cc/KvX52gqw/images-3.jpg',
    'details':
        'ফসলের রোগ ও পোকামাকড় একসাথে কিভাবে নিয়ন্ত্রণ করবেন তার বিস্তারিত।',
  },
    // ... (rest of your pest data remains the same)
  ];

  List<Map<String, dynamic>> filteredPests = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPests = pests;
    searchController.addListener(_filterPests);
  }

  void _filterPests() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredPests = pests.where((pest) {
        final nameLower = pest['name'].toLowerCase();
        final descLower = pest['description'].toLowerCase();
        return nameLower.contains(query) || descLower.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text(
          "বালাই এবং রোগ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 3,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PestsSearchDelegate(pests),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'জেলা বা নাম দিয়ে খুঁজুন...',
                prefixIcon: Icon(Icons.search, color: Colors.green.shade700),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.green.shade200, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.green.shade700, width: 2),
                ),
              ),
              cursorColor: Colors.green.shade700,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: filteredPests.isEmpty
                ? Center(
                    child: Text(
                      "কোনো তথ্য পাওয়া যায়নি।",
                      style: TextStyle(color: Colors.grey[600], fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: filteredPests.length,
                    itemBuilder: (context, index) {
                      final pest = filteredPests[index];
                      return _buildPestCard(context, pest);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildPestCard(BuildContext context, Map<String, dynamic> pest) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(bottom: 16),
      elevation: 6,
      shadowColor: Colors.green.withOpacity(0.3),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _openDetails(context, pest),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(  // Changed from Image.asset to Image.network
                  pest['image'],
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pest['name'],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900),
                    ),
                    SizedBox(height: 8),
                    Text(
                      pest['description'],
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          height: 1.3),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.green.shade400),
            ],
          ),
        ),
      ),
    );
  }

  void _openDetails(BuildContext context, Map<String, dynamic> pest) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PestDetailPage(pest: pest),
      ),
    );
  }
}

// Search Delegate for better UX search
class PestsSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> pests;
  PestsSearchDelegate(this.pests);

  @override
  String get searchFieldLabel => 'পোকা বা রোগ অনুসন্ধান করুন...';

  @override
  TextStyle? get searchFieldStyle => TextStyle(fontSize: 16);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        if (query.isNotEmpty)
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              query = '';
              showSuggestions(context);
            },
          ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    final results = pests.where((pest) {
      final nameLower = pest['name'].toLowerCase();
      final descLower = pest['description'].toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower) || descLower.contains(queryLower);
    }).toList();

    if (results.isEmpty) {
      return Center(
        child: Text(
          "কোনো তথ্য পাওয়া যায়নি।",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final pest = results[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(  // Changed from Image.asset to Image.network
              pest['image'], 
              width: 50, 
              height: 50, 
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          ),
          title: Text(pest['name']),
          subtitle: Text(pest['description']),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            close(context, null);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => PestDetailPage(pest: pest)),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = pests.where((pest) {
      final nameLower = pest['name'].toLowerCase();
      final descLower = pest['description'].toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower) || descLower.contains(queryLower);
    }).toList();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final pest = suggestions[index];
        return ListTile(
          leading: Icon(Icons.bug_report, color: Colors.green.shade700),
          title: RichText(
            text: TextSpan(
              text: pest['name'].substring(0, pest['name'].toLowerCase().indexOf(query.toLowerCase()) >= 0 ? pest['name'].toLowerCase().indexOf(query.toLowerCase()) : 0),
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: pest['name'].substring(
                        pest['name'].toLowerCase().indexOf(query.toLowerCase()),
                        pest['name'].toLowerCase().indexOf(query.toLowerCase()) + query.length),
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: pest['name'].substring(pest['name'].toLowerCase().indexOf(query.toLowerCase()) + query.length),
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          onTap: () {
            query = pest['name'];
            showResults(context);
          },
        );
      },
    );
  }
}

// Detail Page with zoomable image and full info
class PestDetailPage extends StatelessWidget {
  final Map<String, dynamic> pest;
  const PestDetailPage({required this.pest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pest['name']),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InteractiveViewer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(  // Changed from Image.asset to Image.network
                  pest['image'],
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              pest['name'],
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900),
            ),
            SizedBox(height: 12),
            Text(
              pest['details'] ?? pest['description'],
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.grey[800]),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
              ),
              icon: Icon(Icons.share),
                label: Text('শেয়ার করুন', style: TextStyle(fontSize: 16, color: Colors.white)),
              onPressed: () {
                // Implement share functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
