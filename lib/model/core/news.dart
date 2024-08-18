class News {
  final String title;
  final List<String> photo;  // List of photo URLs
  final String date;
  final String author;
  final String description;

  News({
    required this.title,
    required this.photo,
    required this.date,
    required this.author,
    required this.description,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    var photoData = json['photo'];
    List<String> photoList = [];

    if (photoData is String) {
      photoList = [photoData];  // Convert single URL to list
    } else if (photoData is List) {
      photoList = List<String>.from(photoData);  // Convert list of URLs
    }

    return News(
      title: json['title'] as String,
      photo: photoList,
      date: json['date'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
    );
  }
}
