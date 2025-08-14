class Catatan {
  final int? id;
  final String namaPeserta;
  final String email;
  final String namaEvent;
  final String asalKota;

  Catatan({
    this.id,
    required this.namaPeserta,
    required this.email,
    required this.namaEvent,
    required this.asalKota,
  });

  factory Catatan.fromMap(Map<String, dynamic> map) {
    return Catatan(
      id: map['id'] as int?,
      namaPeserta: map['namaPeserta'] as String,
      email: map['email'] as String,
      namaEvent: map['namaEvent'] as String,
      asalKota: map['asalKota'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaPeserta': namaPeserta,
      'email': email,
      'namaEvent': namaEvent,
      'asalKota': asalKota,
    };
  }
}
