import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mahaduna/app/data/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class PresensiMasukSheet extends StatefulWidget {
  const PresensiMasukSheet({super.key});

  @override
  _PresensiMasukSheetState createState() => _PresensiMasukSheetState();
}

class _PresensiMasukSheetState extends State<PresensiMasukSheet> {
  File? _pickedImage;
  Position? _currentPosition;
  final double targetLatitude = -7.921748265212085;
  final double targetLongitude = 112.54758602255146;
  final double maxDistance = 100; // in meters

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    final Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });

    _checkProximity();
  }

  void _checkProximity() {
    if (_currentPosition != null) {
      final double distance = Geolocator.distanceBetween(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
        targetLatitude,
        targetLongitude,
      );

      if (distance > maxDistance) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Anda berada di luar lokasi presensi"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Anda berada dalam lokasi presensi"),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Presensi Shalat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading:
                  Icon(Icons.calendar_today, color: Constants.primaryColor),
              title: const Text("Tanggal Masuk"),
              subtitle: const Text("Selasa, 23 Agustus 2023"),
            ),
            ListTile(
              leading: Icon(Icons.access_time, color: Constants.primaryColor),
              title: const Text("Jam Masuk"),
              subtitle: const Text("04:00"),
            ),
            const SizedBox(height: 8),
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Center(
                    child: _pickedImage == null
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt,
                                  size: 40, color: Colors.grey),
                              SizedBox(height: 8),
                              Text("Ambil Gambar"),
                            ],
                          )
                        : Image.file(
                            _pickedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _getCurrentLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Setor Lokasi Terkini",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aksi untuk menyelesaikan presensi
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Center(
                child: Text(
                  "Hadir",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
