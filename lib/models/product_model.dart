
class ProductModel {
  String? sha;
  String? url;
  List<Tree>? tree;
  bool? truncated;

  ProductModel({this.sha, this.url, this.tree, this.truncated});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sha = json["sha"];
    url = json["url"];
    tree = json["tree"] == null ? null : (json["tree"] as List).map((e) => Tree.fromJson(e)).toList();
    truncated = json["truncated"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["sha"] = sha;
    _data["url"] = url;
    if(tree != null) {
      _data["tree"] = tree?.map((e) => e.toJson()).toList();
    }
    _data["truncated"] = truncated;
    return _data;
  }
}

class Tree {
  String? path;
  String? mode;
  String? type;
  String? sha;
  int? size;
  String? url;

  Tree({this.path, this.mode, this.type, this.sha, this.size, this.url});

  Tree.fromJson(Map<String, dynamic> json) {
    path = json["path"];
    mode = json["mode"];
    type = json["type"];
    sha = json["sha"];
    size = json["size"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["path"] = path;
    _data["mode"] = mode;
    _data["type"] = type;
    _data["sha"] = sha;
    _data["size"] = size;
    _data["url"] = url;
    return _data;
  }
}