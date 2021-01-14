class PopularedModel {
  String name;
  String image;
  PopularedModel(
    this.name,
    this.image,
  );
}

List<PopularedModel> popular = popularData
    .map((item) => PopularedModel(item['name'], item['image']))
    .toList();

var popularData = [
  {"name": "Beach", "image": "assets/images/travelimage1.jpg"},
  {"name": "Beach", "image": "assets/images/travelimage2.jpg"},
  {"name": "Beach", "image": "assets/images/travelimage2.jpg"},
  {"name": "Beach", "image": "assets/images/travelimage3.jpg"},
];
