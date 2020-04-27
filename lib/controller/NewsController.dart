
class News {
  News({this.newsId, this.newsDate, this.newsTitle, this.newsDetail});

  final String newsId;
  final String newsDate;
  final String newsTitle;
  final String newsDetail;

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      newsId: json['ID'],
      newsDate: json['Date'],
      newsTitle: json['Title'],
      newsDetail: json['NewsDetail'],
    );
  }
}
