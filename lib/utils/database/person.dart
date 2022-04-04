import 'package:objectbox/objectbox.dart';

@Entity()
class Person {
  int id;

  String firstName;
  String lastName;

  Person({this.id = 0, required this.firstName, required this.lastName});
}
