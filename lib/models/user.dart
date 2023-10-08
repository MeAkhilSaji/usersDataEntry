class User {
  final String username;
  final String country;
  final String gender;
  final String dateOfBirth;
  final String imageFilePath;

  User({
    required this.username,
    required this.country,
    required this.gender,
    required this.dateOfBirth,
    required this.imageFilePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'country': country,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'imageFilePath': imageFilePath,
    };
  }
}
