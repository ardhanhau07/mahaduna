class Kerusakan {
  final int idKerusakan;
  final int idMabna;
  final String kamar;
  final int lantai;
  final String gambar;


  // Konversi dari Json ke objek
  factory Kerusakan.fromJson(Map<String, dynamic> Json) {
    return Kerusakan(
      idKerusakan: Json['idKerusakan'],
      idMabna: Json['idMabna'],
      kamar: Json['kamar'],
      lantai: Json['lantai'],
      gambar: Json['gambar'],
    );
  }

  Kerusakan({required this.idKerusakan, required this.idMabna, required this.kamar, required this.lantai, required this.gambar});

  // Konversi ke Json
  Map<String, dynamic> toJson() {
    return {
      'idKerusakan': idKerusakan,
      'idMabna': idMabna,
      'kamar': kamar,
      'lantai': lantai,
      'gambar': gambar,
    };
  }
}
