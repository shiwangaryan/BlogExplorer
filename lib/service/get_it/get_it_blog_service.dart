import 'package:blogexplorer/service/api/api_model.dart';

class GetItBlogService {
  List<BlogModel> blogList= [];

  void setBlogList(List<BlogModel> blogs) {
    blogList= blogs;
  }

  List<BlogModel> getBlogsList() {
    return blogList;
  }
}