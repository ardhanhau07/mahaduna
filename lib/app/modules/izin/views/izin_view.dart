import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahaduna/app/data/constants.dart';
import 'package:mahaduna/models/izin.dart';
import 'package:mahaduna/services/izinService.dart';

class IzinView extends StatefulWidget {
  const IzinView({super.key});

  @override
  State<IzinView> createState() => _IzinViewState();
}

class _IzinViewState extends State<IzinView> {
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;
  String? _jenisKegiatan; // ID kegiatan
  String? _jenisIzin; // Jenis izin
  final IzinService _serviceIzin = IzinService();
  List<Izin> izinList = [];

  Future<void> _ambilGambar() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  Future<void> _createIzin() async {
    try {
      // Pastikan NIM valid
      if (_nimController.text.isEmpty ||
          _jenisKegiatan == null ||
          _jenisIzin == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Semua kolom harus diisi!')),
        );
        return;
      }

      final newIzin = Izin(
        idUser: _nimController.text,
        idKegiatan: _jenisKegiatan!,
        jenis: _jenisIzin!,
        deksripsi: _deskripsiController.text,
        gambar: _pickedImage?.path ?? "", // Ensure image is available
      );

      await _serviceIzin.tambahIzin(newIzin);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Izin berhasil ditambahkan!')),
      );

      setState(() {
        izinList.add(newIzin);
      });
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal menambahkan izin')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('NIM'),
              TextField(
                controller: _nimController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan NIM Anda',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Kegiatan'),
              DropdownButtonFormField<String>(
                value: _jenisKegiatan,
                hint: const Text('Pilih Kegiatan'),
                items: const [
                  DropdownMenuItem(value: "1", child: Text('Jamaah')),
                  DropdownMenuItem(value: "2", child: Text('Taklim')),
                  DropdownMenuItem(value: "3", child: Text('Kesantrian')),
                  DropdownMenuItem(value: "4", child: Text('Bahasa')),
                ],
                onChanged: (value) {
                  setState(() {
                    _jenisKegiatan = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text('Jenis Izin'),
              DropdownButtonFormField<String>(
                value: _jenisIzin,
                hint: const Text('Pilih Jenis Izin'),
                items: const [
                  DropdownMenuItem(
                      value: "Izin Sakit", child: Text('Izin Sakit')),
                  DropdownMenuItem(
                      value: "Izin Keluarga", child: Text('Izin Keluarga')),
                  DropdownMenuItem(
                      value: "Izin Pribadi", child: Text('Izin Pribadi')),
                ],
                onChanged: (value) {
                  setState(() {
                    _jenisIzin = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text("Deskripsi"),
              TextField(
                controller: _deskripsiController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan Deskripsi Izin Anda',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Foto Bukti'),
              GestureDetector(
                onTap: _ambilGambar,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _pickedImage == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt,
                                size: 50, color: Colors.grey),
                            Text('Ambil Gambar'),
                          ],
                        )
                      : Image.file(
                          File(_pickedImage!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 335,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _createIzin,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.primaryColor),
                    child: const Text(
                      'Kirim',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
