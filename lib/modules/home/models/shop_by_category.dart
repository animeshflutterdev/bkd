class ShopByCategory {
  String? viewType;
  String? title;
  int? msgcode;
  String? msgtext;
  List<Results>? results;

  ShopByCategory(
      {this.viewType, this.title, this.msgcode, this.msgtext, this.results});

  ShopByCategory.fromJson(Map<String, dynamic> json) {
    viewType = json['view_type'];
    title = json['title'];
    msgcode = json['msgcode'];
    msgtext = json['msgtext'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['view_type'] = this.viewType;
    data['title'] = this.title;
    data['msgcode'] = this.msgcode;
    data['msgtext'] = this.msgtext;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? label;
  int? displaySequence;
  String? actionUrl;
  String? imageUrl;
  String? transKey;
  String? commnets;

  Results(
      {this.id,
        this.label,
        this.displaySequence,
        this.actionUrl,
        this.imageUrl,
        this.transKey,
        this.commnets});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['Label'];
    displaySequence = json['DisplaySequence'];
    actionUrl = json['ActionUrl'];
    imageUrl = json['ImageUrl'];
    transKey = json['TransKey'];
    commnets = json['Commnets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Label'] = this.label;
    data['DisplaySequence'] = this.displaySequence;
    data['ActionUrl'] = this.actionUrl;
    data['ImageUrl'] = this.imageUrl;
    data['TransKey'] = this.transKey;
    data['Commnets'] = this.commnets;
    return data;
  }
}
