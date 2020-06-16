import 'package:library_utils/library_utils.dart';

class UserModel implements BaseResponse {
  String email;
  String icon;
  int id;
  String username;
  String password;

  UserModel();

  @override
  void fromJson(json) {
    email = json['email'];
    icon = json['icon'];
    id = json['id'];
    username = json['username'];
    password = json['password'];
  }

  UserModel.fromJson(json) {
    email = json['email'];
    icon = json['icon'];
    id = json['id'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'icon': icon,
      'id': id,
      'username': username,
      'password': password,
    };
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"email\":\"$email\"");
    sb.write(",\"icon\":\"$icon\"");
    sb.write(",\"id\":$id");
    sb.write(",\"username\":\"$username\"");
    sb.write(",\"password\":\"$password\"");
    sb.write('}');
    return sb.toString();
  }
}

class LoginRequest implements BaseRequest {
  String username;
  String password;

  LoginRequest(this.username, this.password);

  @override
  Map<String, dynamic> toJson() {
    return {
      'username':username,
      'password':password,
    };
  }
}

class RegisterReq implements BaseRequest {
  String username;
  String password;
  String repassword;

  RegisterReq(this.username, this.password, this.repassword);

  RegisterReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        repassword = json['repassword'];

  @override
  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'repassword': repassword,
      };

  @override
  String toString() {
    return '{' +
        " \"username\":\"" +
        username +
        "\"" +
        ", \"password\":\"" +
        password +
        "\"" +
        ", \"repassword\":\"" +
        repassword +
        "\"" +
        '}';
  }
}
