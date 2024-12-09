class Musyrif {
  final int idMusyrif;
  final String nama;
  final int lantai;
  final String gambar;

  Musyrif({required this.idMusyrif, required this.nama, required this.lantai, required this.gambar});

  // Konversi dari Json ke objek
  factory Musyrif.fromJson(Map<String, dynamic> Json) {
    return Musyrif(
      idMusyrif: Json['idMusyrif'],
      nama: Json['nama'],
      lantai: Json['lantai'],
      gambar: Json['gambar'],
    );
  }

  // Konversi ke Json
  Map<String, dynamic> toJson() {
    return {
      'idMusyrif': idMusyrif,
      'nama': nama,
      'lantai': lantai,
      'gambar': gambar,
    };
  }
}
