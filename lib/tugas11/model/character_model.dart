// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final Info info;
  final List<Result> results;

  Welcome({required this.info, required this.results});

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    info: Info.fromJson(json["info"]),
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Info({required this.count, required this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class Result {
  final int id;
  final String name;
  final String status;
  final String species;
  final String? type;
  final String gender;
  final Location origin;
  final Location location;
  final String? image;
  final List<String> episode;
  final String url;
  final DateTime created;

  Result({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    this.type,
    required this.gender,
    required this.origin,
    required this.location,
    this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"],
    type: json["type"] == "" ? null : json["type"],
    gender: json["gender"],
    origin: Location.fromJson(json["origin"]),
    location: Location.fromJson(json["location"]),
    image: json["image"],
    episode: List<String>.from(json["episode"].map((x) => x)),
    url: json["url"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "species": species,
    "type": type,
    "gender": gender,
    "origin": origin.toJson(),
    "location": location.toJson(),
    "image": image,
    "episode": List<dynamic>.from(episode.map((x) => x)),
    "url": url,
    "created": created.toIso8601String(),
  };
}

class Location {
  final String? name;
  final String? url;

  Location({this.name, this.url});

  factory Location.fromJson(Map<String, dynamic> json) =>
      Location(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class Episode {
  final int id;
  final String name;
  final String airDate;
  final String episodeCode;
  final String url;

  Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episodeCode,
    required this.url,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    id: json["id"],
    name: json["name"],
    airDate: json["air_date"],
    episodeCode: json["episode"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "air_date": airDate,
    "episode": episodeCode,
    "url": url,
  };
}
