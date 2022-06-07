import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> list;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Function returnHour;
  const CustomTabBar({
    Key? key,
    required this.list,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.returnHour,
  }) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<Widget> widgetList = [];

  widgetListMaker(List list) {
    for (String text in list) {
      setState(() {
        widgetList.add(buildTab(text, widget.textColor));
      });
    }
  }

  Container buildTab(String text, Color color) {
    return Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: Text(
          text,
          style: TextStyle(color: color),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: widget.list.length, vsync: this);
    widgetList = [];
    widgetListMaker(widget.list);
    return TabBar(
        onTap: (value) {
          widget.returnHour(widget.list[value]);
        },
        controller: tabController,
        isScrollable: true,
        indicator: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(width: 2, color: widget.borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        tabs: widgetList);
  }
}
