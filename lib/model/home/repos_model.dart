import 'package:library_utils/library_utils.dart';

class ComData extends BaseResponse {
  int curPage;
  List datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  @override
  void fromJson(json) {
    curPage = json['curPage'];
    datas = json['datas'];
    offset = json['offset'];
    over = json['over'];
    pageCount = json['pageCount'];
    size = json['size'];
    total = json['total'];
  }
}

class ReposModelList {
  List<ReposModel> list = [];

  void fromJson(json) {
    if (json is List) {
      list = json.map((e) => ReposModel.fromJson(e)).toList();
    }
  }
}

class ReposModel {
  int id;
  int originId;
  String title;
  String desc;
  String author;
  String link;
  String projectLink;
  String envelopePic;
  String superChapterName;
  int publishTime;
  bool collect;

  int type; //1项目，2文章
  bool isShowHeader;


  ReposModel();

  ReposModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        originId = json['originId'],
        title = json['title'],
        desc = json['desc'],
        author = json['author'],
        link = json['link'],
        projectLink = json['projectLink'],
        envelopePic = json['envelopePic'],
        superChapterName = json['superChapterName'],
        publishTime = json['publishTime'],
        collect = json['collect'],
        type = json['type'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'originId': originId,
        'title': title,
        'desc': desc,
        'author': author,
        'link': link,
        'projectLink': projectLink,
        'envelopePic': envelopePic,
        'superChapterName': superChapterName,
        'publishTime': publishTime,
        'collect': collect,
        'type': type,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"id\":$id");
    sb.write(",\"originId\":$originId");
    sb.write(",\"title\":\"$title\"");
    sb.write(",\"desc\":\"$desc\"");
    sb.write(",\"author\":\"$author\"");
    sb.write(",\"link\":\"$link\"");
    sb.write(",\"projectLink\":\"$projectLink\"");
    sb.write(",\"envelopePic\":\"$envelopePic\"");
    sb.write(",\"superChapterName\":\"$superChapterName\"");
    sb.write(",\"publishTime\":\"$publishTime\"");
    sb.write(",\"collect\":$collect");
    sb.write(",\"type\":$type");
    sb.write('}');
    return sb.toString();
  }
}

class CommRequest extends BaseRequest {
  int cid;

  CommRequest(this.cid);

  @override
  Map<String, dynamic> toJson() {
    return {'cid': cid};
  }
}
