import 'package:blogexplorer/widgets/blog_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookmarksScreenBody extends StatelessWidget {
  const BookmarksScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
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
            "View\nBookmarks",
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
          ValueListenableBuilder<Box>(
            valueListenable: Hive.box('bookmarks').listenable(),
            builder: (context, box, widget) {
              return box.isEmpty
                  ? Text(
                      'Oops! no articles bookmarked yet.',
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
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          final key = box.keyAt(index);
                          final title = box.getAt(index)[0];
                          final imgUrl = box.getAt(index)[1];
                          return BlogListWidget(
                              id: key, title: title, imgUrl: imgUrl);
                        },
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
