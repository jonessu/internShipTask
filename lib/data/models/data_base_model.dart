class Person {
  final int id;
  final String name;

  Person({
    required this.id,
    required this.name,
  });

  // Convert a Person into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Implement toString to make it easier to see information about
  // each Person when using the print statement.
  @override
  String toString() {
    return 'Person{id: $id, name: $name}';
  }
}
