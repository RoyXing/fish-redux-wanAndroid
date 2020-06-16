import 'package:azlistview/azlistview.dart';
import 'package:library_utils/library_utils.dart';

class TreeModelList implements BaseResponse {
  List<TreeModel> list = [];

  @override
  void fromJson(json) {
    if (json is List) {
      list = json.map((e) => TreeModel.fromJson(e)).toList();
    }
  }
}

class TreeModel extends ISuspensionBean {
  String name;
  int id;
  List<TreeModel> children;
  String tagIndex;

  TreeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    children = (json['children'] as List).map((e) => e == null ? null : TreeModel.fromJson(e))?.toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'children': children,
    };
  }

  @override
  String getSuspensionTag() {
    return tagIndex;
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"name\":\"$name\"");
    sb.write(",\"id\":$id");
    sb.write(",\"children\":$children");
    sb.write('}');
    return sb.toString();
  }
}
