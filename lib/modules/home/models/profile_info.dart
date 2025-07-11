class ProfileInfo {
  String? isShow;
  List<Results>? results;
  String? imageUrl;
  String? title;
  String? viewType;
  String? subViewType;
  int? msgcode;

  ProfileInfo(
      {this.isShow,
        this.results,
        this.imageUrl,
        this.title,
        this.viewType,
        this.subViewType,
        this.msgcode});

  ProfileInfo.fromJson(Map<String, dynamic> json) {
    isShow = json['is_show'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    imageUrl = json['imageUrl'];
    title = json['title'];
    viewType = json['view_type'];
    subViewType = json['sub_view_type'];
    msgcode = json['msgcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_show'] = this.isShow;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['view_type'] = this.viewType;
    data['sub_view_type'] = this.subViewType;
    data['msgcode'] = this.msgcode;
    return data;
  }
}

class Results {
  String? title;
  String? desc;
  String? actionUrl;

  Results({this.title, this.desc, this.actionUrl});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    actionUrl = json['actionUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['actionUrl'] = this.actionUrl;
    return data;
  }
}
