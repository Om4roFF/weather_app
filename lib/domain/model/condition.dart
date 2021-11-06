
class Condition{
  final String text;
  final String icon;
  final int code;

  Condition({required this.text, required this.icon, required this.code});


  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
    icon: json["icon"],
    code: json["code"],
  );

}