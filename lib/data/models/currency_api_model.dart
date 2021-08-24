class Exchange {
  Exchange({
    required this.timestamp,
    required this.source,
    required this.date,
    required this.rates,
  });

  int timestamp;
  String source;
  DateTime date;
  Map<String, double> rates;

  factory Exchange.fromJson(Map<String, dynamic> json) => Exchange(
        timestamp: json["timestamp"],
        source: json["source"],
        date: DateTime.parse(json["date"]),
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "source": source,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
