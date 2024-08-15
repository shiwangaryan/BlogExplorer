import 'package:hive/hive.dart';

class HiveServices {
  // opening boxes
  var blogsBox = Hive.box('allBlogs');
  var bookmarksBox = Hive.box('bookmarks');

  // calling functions to boxes:
  void addBookmark(String id, String title, String imgUrl) {
    bookmarksBox.put(id, [title, imgUrl]);
    readBlogs();
  }

  void readBlogs() {
    for (int i = 0; i < bookmarksBox.length; i++) {
      print(bookmarksBox.getAt(i)[0]);
    }
  }
}
