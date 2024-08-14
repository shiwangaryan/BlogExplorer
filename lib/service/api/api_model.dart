class BlogModel {
  String? id;
  String? imageurl;
  String? title;

  BlogModel({this.id, this.imageurl, this.title});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      imageurl: json['image_url'],
      title: json['title'],
    );
  }
}

class BlogResponseList {
  List<BlogModel> blogList;

  BlogResponseList({required this.blogList});

  factory BlogResponseList.fromJson(Map<String, dynamic> json) {
    var response = json['blogs'] as List;
    List<BlogModel> blogList =
        response.map((e) => BlogModel.fromJson(e)).toList();
    return BlogResponseList(blogList: blogList);
  }
}
