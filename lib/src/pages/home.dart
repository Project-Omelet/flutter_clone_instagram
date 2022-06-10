import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        const AvatarWidget(
          type: AvatarType.type2,
          thumbPath:
              'https://biz.chosun.com/resizer/riNfbxDlOU7f7UP5S4qmMK7rBts=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/WWCGXNYTRFFWTO3NT5DQTGD3EA.jpg',
          size: 70,
        ),
        Positioned(
          right: 2,
          bottom: 2,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: Colors.white, width: 2)),
            child: const Center(
              child: Text(
                '+',
                style:
                    TextStyle(fontSize: 20, color: Colors.white, height: 1.1),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          _myStory(),
          const SizedBox(
            width: 5,
          ),
          ...List.generate(
              100,
              (index) => const AvatarWidget(
                  size: 65,
                  type: AvatarType.type1,
                  thumbPath:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3ur_QI0GejFNytcFOs2sudVKBhAuGFdq9eA&usqp=CAU'))
        ],
      ),
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => const PostWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: ImageData(IconsPath.logo, width: 270),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ImageData(IconsPath.directMessage, width: 50)),
          )
        ],
      ),
      body: ListView(children: [_storyBoardList(), _postList()]),
    );
  }
}
