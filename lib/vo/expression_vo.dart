class ExpressionVo {
  const ExpressionVo({required this.name, required this.type, required this.value});

  final String name;
  final int type;
  final dynamic value;

  factory ExpressionVo.fromJson(Map<String, dynamic> json) {
    if (json['value'] is! List) {
      return ExpressionVo(
          name: json['name'],
          type: json['type'],
          value: json['value']
      );
    }

    return ExpressionVo(
        name: json['name'],
        type: json['type'],
        value: (json['value'] as List).map((p) => ExpressionVo.fromJson(p)).toList()
    );
  }
}
