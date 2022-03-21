import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> list;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  const CustomTabBar({Key? key,
    required this.list,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor
  }) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin  {

  late TabController tabController;
  List<Widget> widgetList = [];

  widgetListMaker(List list){
    for(String text in list){
      widgetList.add(buildTab(text));
    }
  }


  Container buildTab(String text) {
    return Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: Text(
          text,
          style: TextStyle(color: widget.textColor),
        ));
  }

  @override
  void initState() {
    tabController = TabController(length: widget.list.length, vsync: this);
    widgetListMaker(widget.list);
    super.initState();

  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabController,
        isScrollable: true,
        indicator: BoxDecoration(
            color: widget.backgroundColor,
            border:
            Border.all(width: 2, color: widget.borderColor),
            borderRadius:
            const BorderRadius.all(Radius.circular(10))),
        tabs: widgetList);
  }
}
