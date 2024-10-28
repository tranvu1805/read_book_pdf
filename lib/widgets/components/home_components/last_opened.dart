import 'package:flutter/material.dart';

class LastOpened extends StatefulWidget {
  final int length;
  final List<Widget> list;

  const LastOpened({super.key, required this.length, required this.list});

  @override
  State<LastOpened> createState() => _LastOpenedState();
}

class _LastOpenedState extends State<LastOpened> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: widget.list,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabPageSelector(controller: tabController,indicatorSize: 8,color: Colors.grey,
          selectedColor: Colors.green[900],borderStyle: BorderStyle.none,),
        ),
      ],
    );
  }
}
