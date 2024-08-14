import 'dart:convert';

import 'package:blogexplorer/constants.dart';
import 'package:blogexplorer/main.dart';
import 'package:blogexplorer/service/api/api_model.dart';
import 'package:blogexplorer/service/get_it/get_it_blog_service.dart';
import 'package:http/http.dart' as http;

Future<void> getAPIBlogs() async {
  const String uri = "https://intent-kit-16.hasura.app/api/rest/blogs";

  try {
    var response = await http.get(
      Uri.parse(uri),
      headers: {urlHeader: adminSecretKey},
    );
    if(response.statusCode== 200) {
      // print(response.body);
      var jsonBody= jsonDecode(response.body);
      List<BlogModel> blogList= BlogResponseList.fromJson(jsonBody).blogList;
      getIt<GetItBlogService>().setBlogList(blogList);
      print(blogList);
    }
    else {
      print("error with code: ${response.statusCode}");
      print("error with body: ${response.body}");
    }
  } catch (e) {
    print(e);
  }
}
