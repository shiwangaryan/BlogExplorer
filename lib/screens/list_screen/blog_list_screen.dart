import 'package:blogexplorer/main.dart';
import 'package:blogexplorer/service/get_it/get_it_blog_service.dart';
import 'package:blogexplorer/widgets/blog_list_widget.dart';
import 'package:flutter/material.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
    final blogsList = getIt<GetItBlogService>().getBlogsList();

    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 50,
        leading: Container(
          margin: const EdgeInsets.only(left: 5.0, top: 5),
          child: IconButton(
            onPressed: () {},
            iconSize: 20,
            icon: !dark
                ? Image.asset('assets/images/menu_burger_light.png')
                : Image.asset('assets/images/menu_burger_dark.png'),
          ),
        ),
      ),
      body: Padding(
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
            blogsList.isEmpty
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
                      itemCount: blogsList.length,
                      itemBuilder: (context, index) {
                        return BlogListWidget(
                          id: blogsList[index].id!,
                          title: blogsList[index].title!,
                          imgUrl: blogsList[index].imageurl!,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
