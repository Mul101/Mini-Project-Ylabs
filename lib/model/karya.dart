// To parse this JSON data, do
//
//     final karya = karyaFromJson(jsonString);

import 'dart:convert';

List<Karya> karyaFromJson(String str) => List<Karya>.from(json.decode(str).map((x) => Karya.fromJson(x)));

String karyaToJson(List<Karya> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Karya {
    Karya({
        this.id,
        this.authorId,
        this.title,
        this.desc,
        this.genre,
        this.image,
        this.community,
        this.favorite,
        this.createdAt,
        this.data,
        this.v,
    });

    String? id;
    String? authorId;
    String? title;
    String? desc;
    List<String>? genre;
    String? image;
    String? community;
    List<dynamic>? favorite;
    DateTime? createdAt;
    List<Datum>? data;
    int? v;

    factory Karya.fromJson(Map<String, dynamic> json) => Karya(
        id: json["_id"],
        authorId: json["authorId"],
        title: json["title"],
        desc: json["desc"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        image: json["image"],
        community: json["community"],
        favorite: List<dynamic>.from(json["favorite"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "authorId": authorId,
        "title": title,
        "desc": desc,
        "genre": List<dynamic>.from(genre!.map((x) => x)),
        "image": image,
        "community": community,
        "favorite": List<dynamic>.from(favorite!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "__v": v,
    };
}

class Datum {
    Datum({
        this.chapter,
        this.name,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.id,
    });

    int? chapter;
    String? name;
    List<String>? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? id;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        chapter: json["chapter"],
        name: json["name"],
        image: List<String>.from(json["image"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "chapter": chapter,
        "name": name,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "_id": id,
    };
}
