class IndicatorVo {
  const IndicatorVo({required this.id, required this.name, required this.expression});

  final int id;
  final String name;
  final String expression;

  factory IndicatorVo.fromJson(Map<String, dynamic> json) {
    return IndicatorVo(
        id: json['id'],
        name: json['name'],
        expression: json['expression']
    );
  }

  bool isLeaf() {
    return true;
  }
}
