import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlogListWidget extends StatelessWidget {
  const BlogListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white12,
      ),
      padding: const EdgeInsets.only(
        bottom: 5.0,
        left: 15,
        right: 20,
        top: 5,
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/ocean.jpg',
              width: 175,
              height: 130,
              fit: BoxFit.cover,
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
                    'Best places to go on vacation this summer.',
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Transform.translate(
                    offset: const Offset(-4, 0),
                    child: const Icon(
                      // Icons.bookmark_border_rounded,
                      Icons.bookmark_rounded,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
