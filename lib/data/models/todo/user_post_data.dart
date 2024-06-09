class UserPostModel {
  List<UserPostData>? data;

  UserPostModel({this.data});

  UserPostModel.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      data = <UserPostData>[];
      for (var v in json) {
        data!.add(UserPostData.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (this.data != null) {
      data[''] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserPostData {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserPostData({this.userId, this.id, this.title, this.body});

  UserPostData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
