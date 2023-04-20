import 'package:aichat/chat_page.dart';
import 'package:get/get.dart';

class Routes {

  static final getPages = [
    GetPage(name: '/chatPage', page: () => const ChatPage()),
  ];
}
