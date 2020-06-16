import 'package:fishreduxwanandroid/model/home/banner_model.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';
import 'package:fishreduxwanandroid/model/user/user_model.dart';
import 'package:fishreduxwanandroid/network/apis.dart';
import 'package:fishreduxwanandroid/network/http_repository.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:library_utils/library_utils.dart';

class WanRepository {
  static WanRepository repository;

  WanRepository._();

  factory WanRepository() {
    if (repository == null) {
      repository = WanRepository._();
    }
    return repository;
  }

  Future<List<BannerModel>> getBanner() async {
    BResponse<BannerModelList> response = await HttpRepository.instance
        .get(WanAndroidApi.getPath(path: WanAndroidApi.BANNER), null, BannerModelList());
    if (response.isSuccess) {
      return response.result.list;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<List<ReposModel>> getProjectList({int page: 1, data}) async {
    BResponse<ComData> response = await HttpRepository.instance
        .get(WanAndroidApi.getPath(path: WanAndroidApi.PROJECT_LIST, page: page), data, ComData());
    if (response.isSuccess) {
      var reposModel = ReposModelList();
      reposModel.fromJson(response.result.datas);
      return reposModel.list;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<List<ReposModel>> getWXArticleList({int id, int page: 1, data}) async {
    BResponse<ComData> response = await HttpRepository.instance
        .get(WanAndroidApi.getPath(path: WanAndroidApi.WXARTICLE_LIST + "/$id", page: page), data, ComData());
    if (response.isSuccess) {
      var reposModel = ReposModelList();
      reposModel.fromJson(response.result.datas);
      return reposModel.list;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<List<ReposModel>> getArticleListProject(int page) async {
    BResponse<ComData> response = await HttpRepository.instance
        .get(WanAndroidApi.getPath(path: WanAndroidApi.ARTICLE_LISTPROJECT, page: page), null, ComData());
    if (response.isSuccess) {
      var reposModel = ReposModelList();
      reposModel.fromJson(response.result.datas);
      return reposModel.list;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<List<ReposModel>> getArticleList({int page, data}) async {
    BResponse<ComData> response = await HttpRepository.instance
        .get(WanAndroidApi.getPath(path: WanAndroidApi.ARTICLE_LIST, page: page), data, ComData());
    if (response.isSuccess) {
      var reposModel = ReposModelList();
      reposModel.fromJson(response.result.datas);
      return reposModel.list;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<List<TreeModel>> getTreeList() async {
    BResponse<TreeModelList> response = await HttpRepository.instance
        .get(WanAndroidApi.getPath(path: WanAndroidApi.TREE), null, TreeModelList());
    if (response.isSuccess) {
      return response.result.list;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<List<TreeModel>> getProjectTree() async {
    BResponse<TreeModelList> response = await HttpRepository.instance
        .get(WanAndroidApi.getPath(path: WanAndroidApi.PROJECT_TREE), null, TreeModelList());
    if (response.isSuccess) {
      return response.result.list;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<List<TreeModel>> getWxArticleTree() async {
    BResponse<TreeModelList> response = await HttpRepository.instance
        .get(WanAndroidApi.getPath(path: WanAndroidApi.WXARTICLE_CHAPTERS), null, TreeModelList());
    if (response.isSuccess) {
      return response.result.list;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<UserModel> login(LoginRequest loginRequest) async {
    BaseRespR<UserModel> response =
        await HttpRepository.instance.loginPost(WanAndroidApi.user_login, loginRequest, UserModel());
    if (response.code == 200) {
      response.response.headers.forEach((name, values) {
        if (name == 'set-cookie') {
          String cookie = values.toString();
          SpUtil.putString(Constant.keyAppToken, cookie);
          HttpRepository.instance.setHeader(cookie);
        }
      });
      return response.data;
    } else {
      return Future.error(response.msg);
    }
  }

  Future<UserModel> register(RegisterReq req) async {
    BaseRespR<UserModel> response =
        await HttpRepository.instance.loginPost(WanAndroidApi.user_register, req, UserModel());
    if (response.code == 200) {
      response.response.headers.forEach((name, values) {
        if (name == 'set-cookie') {
          String cookie = values.toString();
          SpUtil.putString(Constant.keyAppToken, cookie);
          HttpRepository.instance.setHeader(cookie);
        }
      });
      return response.data;
    } else {
      return Future.error(response.msg);
    }
  }

  Future<List<ReposModel>> getCollectList(int page) async {
    BResponse<ComData> response = await HttpRepository.instance
        .get(WanAndroidApi.getPath(path: WanAndroidApi.lg_collect_list, page: page), null, ComData());
    if (response.isSuccess) {
      var reposModel = ReposModelList();
      reposModel.fromJson(response.result.datas);
      return reposModel.list;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<bool> collect(int id) async {
    BResponse response =
        (await HttpRepository.instance.post(WanAndroidApi.getPath(path: WanAndroidApi.lg_collect, page: id)));
    if (response.isSuccess) {
      return true;
    } else {
      return Future.error(response.errMessage);
    }
  }

  Future<bool> unCollect(int id) async {
    BResponse response = (await HttpRepository.instance
        .post(WanAndroidApi.getPath(path: WanAndroidApi.lg_uncollect_originid, page: id)));
    if (response.isSuccess) {
      return true;
    } else {
      return Future.error(response.errMessage);
    }
  }
}
