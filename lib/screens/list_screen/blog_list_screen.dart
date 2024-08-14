import 'package:blogexplorer/widgets/blog_list_widget/blog_list_widget.dart';
import 'package:flutter/material.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 50,
        leading: Container(
          margin: const EdgeInsets.only(left: 5.0, top: 5),
          child: IconButton(
            onPressed: () {},
            iconSize: 20,
            icon:
                WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                        Brightness.light
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
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return BlogListWidget(id: index);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Colors.black,
          child: const Icon(
            size: 33,
            Icons.bookmark_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
