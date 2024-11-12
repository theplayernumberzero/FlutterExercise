// ignore_for_file: public_member_api_docs, sort_constructors_first
class Yonetmenler {
  String yonetmen_id;
  String yonetmen_ad;

  Yonetmenler({
    required this.yonetmen_id,
    required this.yonetmen_ad,
  });

  factory Yonetmenler.fromJson(Map<String, dynamic> json){

    return Yonetmenler(yonetmen_id: json["yonetmen_id"] as String, yonetmen_ad: json["yonetmen_ad"] as String);
  }
}
