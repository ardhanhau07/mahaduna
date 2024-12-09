import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/constants.dart';
import '../controllers/informasi_controller.dart';

class InformasiView extends GetView<InformasiController> {
  InformasiView({super.key});
  final TextEditingController _kamarController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Mabna'),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.mabna.value == ""
                      ? null
                      : controller.mabna.value,
                  items: const [
                    DropdownMenuItem(
                        value: "Al Ghazali", child: Text('Al Ghazali')),
                    DropdownMenuItem(
                        value: "Ibn Rusyd", child: Text('Ibn Rusyd')),
                    DropdownMenuItem(
                        value: "Ibn Sina", child: Text('Ibn Sina')),
                    DropdownMenuItem(
                        value: "Al Muhasibi", child: Text('Al Muhasibi')),
                    DropdownMenuItem(
                        value: "Ibn Khaldun", child: Text('Ibn Khaldun')),
                    DropdownMenuItem(
                        value: "Al Faraby", child: Text('Al Faraby')),
                    DropdownMenuItem(value: "Ar Razi", child: Text('Ar Razi')),
                    DropdownMenuItem(
                        value: "Al Khawarizmi", child: Text('Al Khawarizmi')),
                    DropdownMenuItem(
                        value: "Ummu Salamah", child: Text('Ummu Salamah')),
                    DropdownMenuItem(
                        value: "Fatimah Az Zahra",
                        child: Text('Fatimah Az Zahra')),
                    DropdownMenuItem(
                        value: "ِAsma' Binti Abu Bakar",
                        child: Text("Asma' Binti Abu Bakar")),
                    DropdownMenuItem(
                        value: "ِKhadijah Al Kubro",
                        child: Text("Khadijah Al Kubro")),
                  ],
                  onChanged: (value) {
                    controller.updateMabna(value);
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('Kamar'),
              TextField(
                controller: _kamarController,
                maxLines: 1,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Kamar Anda'),
              ),
              const SizedBox(height: 20),
              const Text('Lantai'),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.lantai.value == ""
                      ? null
                      : controller.lantai.value,
                  items: const [
                    DropdownMenuItem(value: "1", child: Text('1')),
                    DropdownMenuItem(value: "2", child: Text('2')),
                    DropdownMenuItem(value: "3", child: Text('3')),
                    DropdownMenuItem(value: "4", child: Text('4')),
                    DropdownMenuItem(value: "5", child: Text('5')),
                  ],
                  onChanged: (value) {
                    controller.updateLantai(value);
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('Foto Kerusakan'),
              GestureDetector(
                onTap: () => controller.ambilGambar(),
                child: Obx(
                  () => Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: controller.pickedImage.value == null
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                Text('Ambil Gambar')
                              ],
                            )
                          : Image.file(
                              File(controller.pickedImage.value!.path),
                              fit: BoxFit.cover,
                            )),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 335,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
