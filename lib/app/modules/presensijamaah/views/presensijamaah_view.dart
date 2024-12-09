import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaduna/app/modules/presensijamaah/views/presensimasuk.dart';

import '../controllers/presensijamaah_controller.dart';

class PresensijamaahView extends GetView<PresensijamaahController> {
  const PresensijamaahView({super.key});
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kehadiran Hari Ini',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Rekap Absen',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildActionButton(
                    context, // Pass context here
                    "Sholat Shubuh",
                    "03:53 - 04:00",
                    Colors.blueAccent,
                    "Presensi",
                    'assets/images/shalatjamaah.jpeg',
                  ),
                  _buildActionButton(
                    context, // Pass context here
                    "Shalat Maghrib",
                    "17:37 - 17:55",
                    Colors.green,
                    "Presensi",
                    'assets/images/shalatjamaah.jpeg',
                  ),
                  _buildActionButton(
                    context, // Pass context here
                    "Shalat Isya",
                    "18.46 - 19.00",
                    Colors.indigo,
                    "Presensi",
                    'assets/images/shalatjamaah.jpeg',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildActionButton(BuildContext context, String title,
    String description, Color color, String buttonText, String image) {
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
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return const PresensiMasukSheet();
                    },
                  );
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
