import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuOne(String menu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        menu,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget _tabMenu() {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: Container(
        width: Size.infinite.width,
        height: AppBar().preferredSize.height,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
        child: TabBar(
            controller: tabController,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            indicatorColor: Colors.black,
            tabs: [
              _tabMenuOne('Top'),
              _tabMenuOne('Account'),
              _tabMenuOne('Audio'),
              _tabMenuOne('Tags'),
              _tabMenuOne('Places'),
            ]),
      ),
    );
  }

  Widget _body() {
    return TabBarView(controller: tabController, children: const [
      Center(child: Text('Top page')),
      Center(child: Text('Account page')),
      Center(child: Text('Audio page')),
      Center(child: Text('Tags page')),
      Center(child: Text('Places page')),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: BottomNavController.to.willPopAction,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(IconsPath.backBtnIcon),
            )),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef)),
          child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '검색',
                  contentPadding: EdgeInsets.only(left: 15, top: 7, bottom: 7),
                  isDense: true)),
        ),
        bottom: _tabMenu(),
      ),
      body: _body(),
    );
  }
}
