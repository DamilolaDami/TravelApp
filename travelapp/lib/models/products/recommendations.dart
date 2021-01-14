class RecommendedModel {
  String name;
  String image;
  RecommendedModel(this.name, this.image);
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(item['name'], item['image']))
    .toList();

var recommendationsData = [
  {"name": "DamiFlutter, Nigeria", "image": "assets/images/travelimage1.jpg"},
  {"name": "DamiFlutter, Nigeria", "image": "assets/images/travelimage2.jpg"},
  {"name": "DamiFlutter, Nigeria", "image": "assets/images/travelimage3.jpg"},
  {"name": "DamiFlutter, Nigeria", "image": "assets/images/travelimage4.jpg"},
  {"name": "DamiFlutter, Nigeria", "image": "assets/images/travelimage1.jpg"},
  {"name": "DamiFlutter, Nigeria", "image": "assets/images/travelimage2.jpg"},
];
