class ToggleConfigCacheEntity {
  final dynamic value;
  final int updateAt;

  ToggleConfigCacheEntity({
    required this.value,
    required this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'toggle': value,
      'updateAt': updateAt,
    };
  }

  factory ToggleConfigCacheEntity.fromMap(Map<String, dynamic> map) {
    return ToggleConfigCacheEntity(
      value: map['value'],
      updateAt: map['updateAt'],
    );
  }
}
