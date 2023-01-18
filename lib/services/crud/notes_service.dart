import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

//reconstruct db path
//Database user
class DatabaseUser {
  final int id;
  final String email;

  DatabaseUser({
    required this.id,
    required this.email,
  });

  DatabaseUser.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        email = map[emailColumn] as String;

  @override
  String toString() => 'Person, Id = $id, email = $email';

  //Covariant tels that it is only comparity can only be done with
  //specifid type
  @override
  bool operator ==(covariant DatabaseUser other) => id == other.id;
}

const idColumn = 'id';
const emailColumn = 'email';
