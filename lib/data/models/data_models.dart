class DataApiModel {
  late int postId;
  late int id;
  late String name;
  late String email;
  late String body;

  DataApiModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory DataApiModel.fromJson(Map<String, dynamic> json) => DataApiModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );
  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
