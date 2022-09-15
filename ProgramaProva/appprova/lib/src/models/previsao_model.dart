class Tempo {
  late double temperatura;
  late String cidade;
  late double humidade;
  late double vento;
  late double chuva;
  late String data;
  late String diaDaSemana;
  late String ceu;
  late String maxima;
  late String minima;
  late String hora;
  late String descricaotempo;

  Tempo(
    this.hora,
    this.descricaotempo,
    this.maxima,
    this.minima,
    this.temperatura,
    this.cidade,
    this.humidade,
    this.vento,
    this.chuva,
    this.data,
    this.diaDaSemana,
    this.ceu,
  );
  Tempo.fromJson(Map<String, dynamic> json) {
    this.hora = json['time'];
    this.descricaotempo = json['description'];
    this.maxima = json['max'];
    this.minima = json['min'];
    this.temperatura = json['temp'];
    this.cidade = json['city'];
    this.humidade = json['humidity'];
    this.vento = json['wind_speedy'];
    this.chuva = json['condition'];
    this.data = json['date'];
    this.ceu = json['condition_slug'];
  }
}
