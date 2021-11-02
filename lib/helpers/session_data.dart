class SessionData {
  String name;
  int vehicleCount;
  int flatNo;
  bool maintainenceStatus;
  List<String> idCards;

  static SessionData _instance;

  factory SessionData({
    String name,
    int vehicleCount,
    int flatNo,
    bool maintainenceStatus,
    List<String> idCards,
  }) {
    _instance ??= SessionData._internal(
      name,
      vehicleCount,
      flatNo,
      maintainenceStatus,
      idCards,
    );
    return _instance;
  }

  SessionData._internal(
    this.name,
    this.vehicleCount,
    this.flatNo,
    this.maintainenceStatus,
    this.idCards,
  );

  static SessionData get instance {
    return _instance;
  }
}
