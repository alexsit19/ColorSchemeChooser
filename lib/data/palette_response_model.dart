class PaletteResponseModel {
  String? id;
  String? title;
  String? userName;
  int? numViews;
  double? numHearts;
  int? rank;
  String? dateCreated;
  List<dynamic>? colors;
  String? url;
  String? imageUrl;
  String? badgeUrl;

  PaletteResponseModel({
    this.id,
    this.title,
    this.userName,
    this.numViews,
    this.numHearts,
    this.rank,
    this.dateCreated,
    this.colors,
    this.url,
    this.imageUrl,
    this.badgeUrl,
  });

  factory PaletteResponseModel.fromJson(Map<String, dynamic> json) {
    return PaletteResponseModel(
      id: json['id'].toString(),
      title: json['title'],
      userName: json['userName'],
      numViews: json['numViews'],
      numHearts: json['numHearts'],
      rank: json['rank'],
      dateCreated: json['dateCreated'],
      colors: json['colors'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      badgeUrl: json['badgeUrl'],
    );
  }
}
