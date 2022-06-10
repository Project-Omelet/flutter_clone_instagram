import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AvatarWidget(
              type: AvatarType.type3,
              nickname: 'MignonMignon',
              size: 40,
              thumbPath:
                  'https://biz.chosun.com/resizer/riNfbxDlOU7f7UP5S4qmMK7rBts=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/WWCGXNYTRFFWTO3NT5DQTGD3EA.jpg'),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(IconsPath.postMoreIcon, width: 30),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrmsOe2xvVlBBmen09KjT3f-hVne6j9H66zw&usqp=CAU');
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(IconsPath.likeOffIcon, width: 65),
              const SizedBox(
                width: 15,
              ),
              ImageData(IconsPath.replyIcon, width: 60),
              const SizedBox(
                width: 15,
              ),
              ImageData(IconsPath.directMessage, width: 55)
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 50,
          )
        ],
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('좋아요 150개', style: TextStyle(fontWeight: FontWeight.bold)),
          ExpandableText(
            'Paw Soapmung!\nNya!!!!!!!!\nNya!!!!!!!!\nNya!!!!!!!!\nNya!!!!!!!!',
            prefixText: 'MignonMignon',
            onPrefixTap: () {
              print('Test Page');
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: '더 보기',
            collapseText: '숨기기',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: () {},
        child: const Text(
          '댓글 199개 모두 보기',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '1일 전',
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(
            height: 15,
          ),
          _image(),
          const SizedBox(
            height: 15,
          ),
          _infoCount(),
          const SizedBox(
            height: 5,
          ),
          _description(),
          const SizedBox(
            height: 5,
          ),
          _replyTextBtn(),
          const SizedBox(
            height: 5,
          ),
          _dateAgo(),
        ],
      ),
    );
  }
}
