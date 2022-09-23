final String tableUsers = 'users';

class UsersFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, name, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String name = 'name';
  static final String time = 'time';
}

class Users {
  final int? id;
  final bool isImportant;
  final int number;
  final String name;
  final DateTime createdTime;

  const Users({
    this.id,
    required this.isImportant,
    required this.number,
    required this.name,
    required this.createdTime,
  });
  Users copy({
    int? id,
    bool? isImportant,
    int? number,
    String? name,
    String? description,
    DateTime? createdTime,
  }) =>
      Users(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        name: name ?? this.name,
        createdTime: createdTime ?? this.createdTime,
      );

  static Users fromJson(Map<String, Object?> json) => Users(
        id: json[UsersFields.id] as int?,
        isImportant: json[UsersFields.isImportant] == 1,
        number: json[UsersFields.number] as int,
        name: json[UsersFields.name] as String,
        createdTime: DateTime.parse(json[UsersFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        UsersFields.id: id,
        UsersFields.name: name,
        UsersFields.isImportant: isImportant ? 1 : 0,
        UsersFields.number: number,
        UsersFields.time: createdTime.toIso8601String(),
      };
}
