
import 'package:flutter/cupertino.dart';

import '../components/home_components/book_item_widget.dart';
import '../components/home_components/last_opened.dart';
import '../components/home_components/top_bar.dart';
import '../setting/setting_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TopBar(
            title: 'Last Opened Book',
            icon: Icon(CupertinoIcons.arrow_right_circle)),
        SizedBox(height: 10,),
        SizedBox(
          height: 200,
          child: LastOpened(
            length: 2,
            list: [
              BookItemWidget(
                  imageURL:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJP1pzo79JhwI25UDOP5rwIyXfLIPp0MHfsQ&s',
                  titleBook:
                      'Design Pattern Design Pattern Design Pattern Design Pattern Design Pattern Design Pattern',
                  author: 'Uncle Bob',
                  type: 'PDF',
                  progress: 50),
              SettingPage()
            ],
          ),
        )
      ],
    );
  }
}
