class Book {
  String title;
  String description;
  String tags;
  String imageUrl;

  Book({
    required this.title,
    required this.description,
    required this.tags,
    required this.imageUrl,
  });


  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      description: json['description'],
      tags: json['tags'],
      imageUrl: json['imageUrl'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'tags': tags,
      'imageUrl': imageUrl,
    };
  }
}
