class AuthorModel {
  final String archive;
  final String href;
  final String name, surname;
  final String job;

  String get displayName => name + " " + surname;

  AuthorModel({
    this.archive,
    this.href,
    this.name,
    this.surname,
    this.job,
  });

  factory AuthorModel.fromRef(Map<String, dynamic> rawJson) => AuthorModel(archive: rawJson["archive"], href: rawJson["href"]);

  factory AuthorModel.fromJson(Map<String, dynamic> rawJson) => AuthorModel(name: rawJson["first_name"], surname: rawJson["last_name"], job: rawJson["job"]);
}
