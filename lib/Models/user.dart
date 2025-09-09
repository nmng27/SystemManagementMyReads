class User{
  final int id;
  final String name;
  final String mail;
  final String phone;
  final DateTime birth;
  final String password;

  const User(
    {
      required this.id,
      required this.name,
      required this.mail,
      required this.birth,
      required this.phone,
      required this.password
    }
  );
}