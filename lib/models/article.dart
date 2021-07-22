class Article {
  String author;
  String title;
  String description;
  String imageUrl;
  String publishedAt;
  String content;
  bool isFav;
  bool isSaved;
  String id;

  Article.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    publishedAt = json['publishedAt'];
    content = json['content'];
    isFav = json['isFav'];
    isSaved = json['isSaved'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    data['isFav'] = this.isFav;
    data['isSaved'] = this.isSaved;
    data['id'] = this.id;
    return data;
  }
}
