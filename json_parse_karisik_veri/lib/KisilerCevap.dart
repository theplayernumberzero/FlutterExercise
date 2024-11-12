// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_parse_karisik_veri/Kisiler.dart';

class KisilerCevap {
  int success;
  List<Kisiler> kisilerListesi;

  KisilerCevap({
    required this.success,
    required this.kisilerListesi,
  });

  factory KisilerCevap.fromJson(Map<String, dynamic> json){

    var jsonArray = json["kisiler"] as List;
    List<Kisiler> kisilerListesi = jsonArray.map((nesne) => Kisiler.fromJson(nesne)).toList();

    return KisilerCevap(success: json["success"] as int, kisilerListesi: kisilerListesi);
  }
}
