class User {
  final String id;
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String avatar;
  final String? bio;

  const User({
    required this.id,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.bio,
  });
}
