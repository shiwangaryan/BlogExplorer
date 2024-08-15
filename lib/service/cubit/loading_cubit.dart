import 'package:blogexplorer/main.dart';
import 'package:blogexplorer/service/api/api_method.dart';
import 'package:blogexplorer/service/cubit/loading_state.dart';
import 'package:blogexplorer/service/get_it/get_it_blog_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(LoadingIncomplete());

  Future<void> initializeApp() async {
    emit(LoadingIncomplete());
    await Hive.initFlutter();
    var allBlogs = await Hive.openBox('allBlogs');
    await Hive.openBox('bookmarks');

    getIt.registerSingleton<GetItBlogService>(GetItBlogService());
    if (allBlogs.isEmpty) {
      //fetching data
      print("fetching blogs, hive empty");
      await getAPIBlogs();

      // adding data to hive
      final blogsList= getIt<GetItBlogService>().getBlogsList();
      for(int i= 0; i< blogsList.length; i++) {
        allBlogs.put(blogsList[i].id, [blogsList[i].title, blogsList[i].imageurl]);
      }
    }
    else {
      print("hive has blogs offline");
    }

    emit(LoadingComplete());
  }
}
