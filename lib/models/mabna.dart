class Mabna {
  final int idMabna;
  final String nama;
  final String gambar;
  final int lantai;

  Mabna({required this.idMabna, required this.nama, required this.gambar, required this.lantai});

  // Konversi dari Json ke objek
  factory Mabna.fromJson(Map<String, dynamic> Json) {
    return Mabna(
      idMabna: Json['idMabna'],
      nama: Json['nama'],
      gambar: Json['gambar'],
      lantai: Json['lantai'],
    );
  }

  // Konversi ke Json
  Map<String, dynamic> toJson() {
    return {
      'idMabna': idMabna,
      'nama': nama,
      'gambar': gambar,
      'lantai': lantai,
    };
  }
}
