// ignore_for_file: public_member_api_docs, sort_constructors_first
class Mesajlar {
  //attributlar json formatındaki valuelara göre belirlenir
  int mesaj_kod;
  String mesaj_icerik;

  Mesajlar({
    required this.mesaj_kod,
    required this.mesaj_icerik,
  });

  factory Mesajlar.fromJson(Map<String, dynamic> json){
    return Mesajlar(mesaj_kod: json["mesaj_kod"] as int,
     mesaj_icerik: json["mesaj_icerik"] as String);
  }
}
