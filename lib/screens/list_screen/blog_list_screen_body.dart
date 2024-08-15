// import 'package:blogexplorer/main.dart';
// import 'package:blogexplorer/service/get_it/get_it_blog_service.dart';
import 'package:blogexplorer/widgets/blog_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BlogListScreenBody extends StatelessWidget {
  const BlogListScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    // final blogsList = getIt<GetItBlogService>().getBlogsList();
    var allBlogs= Hive.box('allBlogs');

    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This is where\nwe tell stories",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 40),
          ),
          const SizedBox(height: 12),
          Container(
            height: 2,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 36),
          allBlogs.isEmpty
              ? Text(
                  'Oops! no blogs available at the moment.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 23),
                )
              : Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast,
                    ),
                    itemCount: allBlogs.length,
                    itemBuilder: (context, index) {
                      final key= allBlogs.keyAt(index);
                      return BlogListWidget(
                        id: key,
                        title: allBlogs.get(key)[0],
                        imgUrl: allBlogs.get(key)[1],
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
