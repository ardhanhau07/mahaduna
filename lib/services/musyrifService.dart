import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mahaduna/services/config.dart';
import '../models/musyrif.dart';

class MusyrifService {
  final String baseUrl =
      Config.baseUrl + 'restful-json-mahad/server/serverMusyrif.php';

  // Ambil Semua Data
  Future<List<Musyrif>> getAllMusyrif() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      // Parsing JSON menjadi List<Musyrif>
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Musyrif.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Tambah Data
  Future<void> tambahMusyrif(Musyrif Musyrif) async {
    final jsonBody = json.encode({
      'idMusyrif': Musyrif.idMusyrif,
      'nama': Musyrif.nama,
      'lantai': Musyrif.lantai,
      'gambar': Musyrif.gambar,
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
  Future<void> editMusyrif(Musyrif Musyrif) async {
    final jsonBody = json.encode({
      'idMusyrif': Musyrif.idMusyrif,
      'nama': Musyrif.nama,
      'lantai': Musyrif.lantai,
      'gambar': Musyrif.gambar,
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
  Future<void> hapusMusyrif(String idMusyrif) async {
    final jsonBody = json.encode({
      'id_Musyrif': idMusyrif,
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
