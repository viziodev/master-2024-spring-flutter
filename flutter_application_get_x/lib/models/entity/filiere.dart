// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Filiere {
     String libelle;
  Filiere({
    required this.libelle,
  });

  Filiere copyWith({
    String? libelle,
  }) {
    return Filiere(
      libelle: libelle ?? this.libelle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'libelle': libelle,
    };
  }

  factory Filiere.fromMap(Map<String, dynamic> map) {
    return Filiere(
      libelle: map['libelle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Filiere.fromJson(String source) => Filiere.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Filiere(libelle: $libelle)';

  @override
  bool operator ==(covariant Filiere other) {
    if (identical(this, other)) return true;
  
    return 
      other.libelle == libelle;
  }

  @override
  int get hashCode => libelle.hashCode;
}
