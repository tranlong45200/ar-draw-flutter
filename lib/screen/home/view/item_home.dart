import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/constanst.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.arrowSvgPath,
  }) : super(key: key);

  final String title;
  final String imagePath;
  final String arrowSvgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color.fromRGBO(222, 231, 248, 1.0),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: AppValues.padding,
          ),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF2970E4),
              fontFamily: "ComicSansMS",
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(
            imagePath,
            fit: BoxFit.cover, // or BoxFit.contain based on your layout needs
            height: 100, // Adjust the height as needed
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 6, bottom: 6, left: 12, right: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFF2970E4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: SvgPicture.asset(arrowSvgPath),
              ),
            ],
          )
        ],
      ),
    );
  }
}

