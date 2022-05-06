class Film {
  String? _id;
  String? _title;
  String? _overview;
  String? _contentType;
  String? _releasedOn;

  Film();

  // ignore: unnecessary_getters_setters
  String? get id => _id;
  // ignore: unnecessary_getters_setters
  String? get title => _title;
  // ignore: unnecessary_getters_setters
  String? get overview => _overview;
  // ignore: unnecessary_getters_setters
  String? get contentType => _contentType;
  // ignore: unnecessary_getters_setters
  String? get releasedOn => _releasedOn;

  set id(String? value) => _id = value;
  set title(String? value) => _title = value;
  set overview(String? value) => _overview = value;
  set contentType(String? value) => _contentType = value;
  set releasedOn(String? value) => _releasedOn = value;

  factory Film.fromJson(dynamic value) {
    Film film = Film();
    film._id = value["id"];
    film._title = value["title"];
    film._overview = value["overview"];
    film._contentType = value["content_type"];
    film._releasedOn = value["released_on"];
    return film;
  }
}