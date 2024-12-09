import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaduna/app/data/constants.dart';

class PresensiView extends StatefulWidget {
  const PresensiView({super.key});

  @override
  _PresensiViewState createState() => _PresensiViewState();
}

class _PresensiViewState extends State<PresensiView> {
  final screenWidth = Get.width;
  final screenHeight = Get.height;

  // List Page Icons
  List<IconData> iconList = [
    Icons.home,
    Icons.event,
    Icons.assignment,
    Icons.person,
  ];

  List<String> titleList = [
    'Presensi',
    'Izin',
    'Profile',
  ];

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/images/santriprofil.jpeg'),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mahasantri',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.king_bed,
                            color: Colors.amber,
                            size: 20,
                          ),
                        ],
                      ),
                      Text('Kamar 82 Lantai 1')
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildActionButton(
                    "Sholat Berjamaah",
                    "Presensi Sholat Berjamaah",
                    Colors.purple,
                    "Presensi",
                    'assets/images/shalatjamaah.jpeg',
                  ),
                  _buildActionButton(
                    "Taklim",
                    "Presensi Taklim",
                    Colors.green,
                    "Presensi",
                    'assets/images/taklim.jpeg',
                  ),
                  _buildActionButton(
                    "Presensi Malam Harian",
                    "Presensi Malam",
                    Colors.indigo,
                    "Presensi",
                    'assets/images/malam.jpeg',
                  ),
                  _buildActionButton(
                    "Tadarus Al Qur'an",
                    "Presensi Tadarus Al Qur'an",
                    Colors.teal,
                    "Presensi",
                    'assets/images/tadarus.jpeg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Constants.primaryColor,
        child: const Icon(
          Icons.fingerprint,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}

Widget _buildEventCard(String title, String date, String imagePath) {
  return Container(
    margin: const EdgeInsets.only(right: 16),
    width: 150,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 150,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(date),
      ],
    ),
  );
}

Widget _buildActionButton(String title, String description, Color color,
    String buttonText, String image) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (title == "Sholat Berjamaah") {
                    Get.toNamed('/presensijamaah');
                  } else if (title == "Taklim") {
                    // Navigasi ke halaman Taklim
                    Get.toNamed('/taklim-page');
                  } else if (title == "Presensi Malam Harian") {
                    // Navigasi ke halaman Presensi Malam
                    Get.toNamed('/presensi-malam');
                  } else if (title == "Tadarus Al Qur'an") {
                    // Navigasi ke halaman Tadarus
                    Get.toNamed('/tadarus-page');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 124,
          height: 124,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
