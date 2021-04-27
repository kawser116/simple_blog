import 'package:simple_blog/Models/author.dart';

class DataModel {

    int id;
    String title;
    String description;
    String cover_photo;
    List<String> categories;
    Author author;

    DataModel({
        this.id,
        this.title,
        this.description,
        this.cover_photo,
        this.categories,
        this.author,
      });

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      cover_photo: json["cover_photo"],
      categories: List<String>.from(json["categories"].map((x) => x)),
      author: Author.fromJson(json["author"]),
    );

    Map<String, dynamic> toJson() => {
      "id": id,
      "title": title,
      "description": description,
      "cover_photo": cover_photo,
      "categories": List<dynamic>.from(categories.map((x) => x)),
      "author": author.toJson(),
    };
}

