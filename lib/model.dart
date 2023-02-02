class Wheather {
  double temperature_c;
  double temperature_la;
  double temperature_lo;
  String condition;
  String img;
  Wheather({
    this.temperature_c = 0,
    this.temperature_la = 0,
    this.temperature_lo = 0,
    this.condition = 'Sunny',
    this.img = '',
  });
  factory Wheather.fromJson(Map<String, dynamic> json) {
    return Wheather(
      temperature_c: json['current']['temp_c'],
      temperature_la: json['location']['lat'],
      temperature_lo: json['location']['lon'],
      condition: json['current']['condition']['text'],
      img: json['current']['condition']['icon'],
    );
  }
}
