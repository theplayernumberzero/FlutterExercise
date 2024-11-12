// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_parse_karisik_veri/Filmler.dart';

class FilmlerCevap {
  int success;
  List<Filmler> filmlerListesi;

  FilmlerCevap({
    required this.success,
    required this.filmlerListesi,
  });

  factory FilmlerCevap.fromJson(Map<String, dynamic> json){

    var jsonArray = json["filmler"] as List;

    List<Filmler> filmlerListesi = jsonArray.map((nesne) => Filmler.fromJson(nesne)).toList();

    return FilmlerCevap(success: json["success"] as int, filmlerListesi: filmlerListesi);
  }
}
