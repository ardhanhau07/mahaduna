import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mahaduna/services/config.dart';
import '../models/Presensi.dart';

class PresensiService {
  final String baseUrl =
      Config.baseUrl+'restful-json-mahad/server/server.php';

  // Ambil Semua Data
  Future<List<Presensi>> getAllPresensi() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      // Parsing JSON menjadi List<Presensi>
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Presensi.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Tambah Data
  Future<void> tambahPresensi(Presensi Presensi) async {
    final jsonBody = json.encode({
      'idPresensi': Presensi.idPresensi,
      'idUser': Presensi.idUser,
      'tanggal': Presensi.tanggal,
      'gambar': Presensi.gambar,
      'lokasi': Presensi.lokasi,
      'aksi': 'tambah',
    });

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal menambah data');
    }
  }

  // Edit Data
  Future<void> editPresensi(Presensi Presensi) async {
    final jsonBody = json.encode({
      'idPresensi': Presensi.idPresensi,
      'idUser': Presensi.idUser,
      'tanggal': Presensi.tanggal,
      'gambar': Presensi.gambar,
      'lokasi': Presensi.lokasi,
      'aksi': 'edit',
    });

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal mengedit data');
    }
  }

  // Hapus Data
  Future<void> hapusPresensi(String idPresensi) async {
    final jsonBody = json.encode({
      'id_Presensi': idPresensi,
      'aksi': 'hapus',
    });

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal menghapus data');
    }
  }
}
