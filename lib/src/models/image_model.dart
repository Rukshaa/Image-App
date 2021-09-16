class ImageModel {
   late String title;
   late String url;
   late int id;

  ImageModel(this.title, this.url, this.id);
  ImageModel.fromJson(Map<String, dynamic> mapData) {
    title = mapData["title"];
    id = mapData["id"];
    url = mapData["url"];
  }
}
