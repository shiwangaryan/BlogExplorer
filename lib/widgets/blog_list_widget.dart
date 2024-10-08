import 'package:blogexplorer/screens/detailed_screen/blog_detail_screen.dart';
import 'package:blogexplorer/service/hive/hive_services.dart';
import 'package:blogexplorer/utils/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BlogListWidget extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  const BlogListWidget(
      {super.key, required this.id, required this.title, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final sizes = Sizes(context: context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BlogDetailScreen(
                id: id,
                asset: imgUrl,
                title: title,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                      Brightness.dark
                  ? Colors.white12
                  : Colors.teal[50],
        ),
        padding: const EdgeInsets.only(
          bottom: 8,
          left: 15,
          right: 20,
          top: 8,
        ),
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: id,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  placeholder: (context, url) => SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/loading_gif.gif'),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/placeholder_image.png'),
                  // width: 175,
                  // height: 130,
                  width: sizes.smallImgWidth,
                  height: sizes.smallImgHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 13),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Transform.translate(
                      offset: const Offset(-17, -12),
                      child: ValueListenableBuilder<Box>(
                        valueListenable: Hive.box('bookmarks').listenable(),
                        builder: (context, box, widget) {
                          return box.get(id) == null
                              ? IconButton(
                                  onPressed: () {
                                    HiveServices()
                                        .addBookmark(id, title, imgUrl);
                                  },
                                  icon:
                                      const Icon(Icons.bookmark_border_rounded),
                                  // icon: const Icon(Icons.bookmark_rounded),
                                  iconSize: 20,
                                )
                              : IconButton(
                                  onPressed: () {
                                    HiveServices().removeBookmark(id);
                                  },
                                  // icon: const Icon(
                                  // Icons.bookmark_border_rounded),
                                  icon: const Icon(Icons.bookmark_rounded),
                                  iconSize: 20,
                                );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
