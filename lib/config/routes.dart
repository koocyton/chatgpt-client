import 'package:dooppchat/page/chat_page.dart';
import 'package:get/get.dart';

class Routes {

  static final getPages = [
    GetPage(name: '/chat',         page: () => ChatPage())
  ];
}
