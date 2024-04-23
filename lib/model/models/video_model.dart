class VideoModel {
  String? name;
  String? key;

  VideoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    key = json['key'];
  }
}