
class UserModel
{
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final int age;
  final String gender;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.age,
    required this.gender,
  });
}