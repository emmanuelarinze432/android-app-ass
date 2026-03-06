import 'package:user_email_task/user.dart';

void main() {
  List<User> users = [
    User("Alex", "alex@example.com"),
    User("Blake", null),
    User("Casey", "casey@work.com"),
  ];

  int validEmailCount = 0;

  for (var user in users) {
    if (user.email != null) {
      print(user.email!.toUpperCase());
      validEmailCount++;
    } else {
      print("${user.name} has no email");
    }
  }

  print("Total users with valid emails: $validEmailCount");
}
