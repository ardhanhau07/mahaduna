import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mahaduna/services/config.dart';
import '../models/izin.dart';

class IzinService {
  final String baseUrl = Config.baseUrl + 'restful-json-mahad/server/serverIzin.php';

  Future<void> tambahIzin(Izin Izin) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
      request.fields['aksi'] = 'tambah';
      request.fields['idUser'] = Izin.idUser;
      request.fields['idKegiatan'] = Izin.idKegiatan;
      request.fields['jenis'] = Izin.jenis;
      request.fields['deskripsi'] = Izin.deksripsi;

      if (Izin.gambar.isNotEmpty) {
        File imageFile = File(Izin.gambar);
        var image = await http.MultipartFile.fromPath('gambar', imageFile.path, contentType: MediaType('image', 'jpeg'));
        request.files.add(image);
      }

      var response = await request.send();

      if (response.statusCode != 200) {
        throw Exception('Gagal menambah data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error while uploading');
    }
  }
}
