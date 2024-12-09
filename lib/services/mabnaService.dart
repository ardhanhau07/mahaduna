import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mahaduna/services/config.dart';
import '../models/Mabna.dart';

class MabnaService {
  final String baseUrl =
      Config.baseUrl + 'restful-json-mahad/server/server.php';

  // Ambil Semua Data
  Future<List<Mabna>> getAllMabna() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      // Parsing JSON menjadi List<Mabna>
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Mabna.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Tambah Data
  Future<void> tambahMabna(Mabna Mabna) async {
    final jsonBody = json.encode({
      'idMabna': Mabna.idMabna,
      'nama': Mabna.nama,
      'lantai': Mabna.lantai,
      'gambar': Mabna.gambar,
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
  Future<void> editMabna(Mabna Mabna) async {
    final jsonBody = json.encode({
      'idMabna': Mabna.idMabna,
      'nama': Mabna.nama,
      'lantai': Mabna.lantai,
      'gambar': Mabna.gambar,
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
  Future<void> hapusMabna(String idMabna) async {
    final jsonBody = json.encode({
      'id_Mabna': idMabna,
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
