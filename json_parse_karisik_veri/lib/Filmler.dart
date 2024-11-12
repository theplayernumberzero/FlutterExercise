// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_parse_karisik_veri/Kategoriler.dart';
import 'package:json_parse_karisik_veri/Yonetmenler.dart';

class Filmler {
  String film_id;
  String film_ad;
  String film_yil;
  String film_resim;
  Kategoriler kategori;
  Yonetmenler yonetmen;

  Filmler({
    required this.film_id,
    required this.film_ad,
    required this.film_yil,
    required this.film_resim,
    required this.kategori,
    required this.yonetmen,
  });

  factory Filmler.fromJson(Map<String, dynamic> json) {
    return Filmler(
        film_id: json["film_id"],
        film_ad: json["film_ad"],
        film_yil: json["film_yil"],
        film_resim: json["film_resim"],
        kategori: Kategoriler.fromJson(json["kategori"]),
        yonetmen: Yonetmenler.fromJson(json["yonetmen"]));
  }
}
