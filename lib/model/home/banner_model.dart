import 'package:library_utils/network/bae_http_model.dart';

class BannerModelList extends BaseResponse {
  List<BannerModel> list = [];

  @override
  void fromJson(json) {
    if (json is List) {
      list = json.map((e) => BannerModel.fromJson(e)).toList();
    }
  }
}

class BannerModel {
  String title;
  int id;
  String url;
  String imagePath;

  BannerModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    url = json['url'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'url': url,
      'imagePath': imagePath,
    };
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"id\":$id");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imagePath\":\"$imagePath\"");
    sb.write('}');
    return sb.toString();
  }
}
