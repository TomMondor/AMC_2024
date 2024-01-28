class User {
  final String name;
  final String surname;
  final String carId;

  User({
    required this.name,
    required this.surname,
    required this.carId,
  });

  toMap() {
    return {
      'name': name,
      'surname': surname,
      'carId': carId,
    };
  }
}