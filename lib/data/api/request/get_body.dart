

class GetBody{

  final String key;
  final String? city;
  final String? day;

  GetBody({required this.key, this.city, this.day});


  Map<String, String> toJson(){
    return {
      'key': key,
      'q': city ?? 'Kiev',
      'days': day ?? '1',
      'aqi': 'no',
    };
  }

}