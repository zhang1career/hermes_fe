class IndicatorVoLite {
  const IndicatorVoLite({required this.id, required this.name});

  final int id;
  final String name;

  factory IndicatorVoLite.fromJson(Map<String, dynamic> json) {
    return IndicatorVoLite(
        id: json['id'],
        name: json['name'],
    );
  }

  bool isLeaf() {
    return true;
  }
}
