import 'package:blogexplorer/service/hive/hive_services.dart';
import 'package:blogexplorer/utils/sizes.dart';
import 'package:blogexplorer/widgets/floating_action_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BlogDetailScreen extends StatelessWidget {
  final String id;
  final String asset;
  final String title;
  const BlogDetailScreen(
      {super.key, required this.id, required this.asset, required this.title});

  @override
  Widget build(BuildContext context) {
    bool dark = WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
    final sizes = Sizes(context: context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace:
            Container(color: Theme.of(context).scaffoldBackgroundColor),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 0, top: 1),
          color: dark ? Colors.white : Colors.black,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            grade: 0.5,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 38, height: 1),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Hero(
                  tag: id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: asset,
                      placeholder: (context, url) =>
                          Image.asset('assets/images/loading_gif.gif'),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/images/placeholder_image.png'),
                      width: double.infinity,
                      height: sizes.largeImgHeight,
                      // height: 320,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: ValueListenableBuilder<Box>(
                  valueListenable: Hive.box('bookmarks').listenable(),
                  builder: (context, box, widget) {
                    return box.get(id) == null
                        ? GestureDetector(
                            onTap: () {
                              HiveServices().addBookmark(id, title, asset);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.bookmark_border_rounded,
                                  color: dark ? Colors.white : Colors.black,
                                  size: 28,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Bookmark article',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              HiveServices().removeBookmark(id);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.bookmark_rounded,
                                  color: dark ? Colors.white : Colors.black,
                                  size: 28,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Remove bookmark',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
