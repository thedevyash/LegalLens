class news {
  String? category;
  String? content;
  String? date;
  String? location;
  String? source;
  String? title;
  String? image;
  news(
      {this.category,
      this.content,
      this.date,
      this.location,
      this.source,
      this.title,
      this.image});

  news.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    content = json['content'];
    date = json['date'];
    location = json['location'];
    source = json['source'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['content'] = this.content;
    data['date'] = this.date;
    data['location'] = this.location;
    data['source'] = this.source;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
