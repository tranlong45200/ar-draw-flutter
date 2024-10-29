import 'dart:io';
import 'dart:typed_data';
import 'package:ar_draw/core/utils/get_file.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class CreationItem extends StatelessWidget {
  File file;
  final String? fileName;
  final DateTime creationTime;
  final int? videoDurationInSeconds;


   CreationItem({
    super.key,
    this.fileName,
    required this.file,
    required this.creationTime,
    this.videoDurationInSeconds

   });

  @override
  Widget build(BuildContext context) {
    bool isVideo = file.path.toLowerCase().endsWith('.mp4');
 
    return Container(
      height: 120,
      decoration: const BoxDecoration(
          color: Color(0xFFDEE7F8),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(
          child: Row(
            children: [
              Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child:isVideo?  FutureBuilder(
            future: _generateThumbnail(file.path),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Image.memory(snapshot.data as Uint8List);
              } else {
                return CircularProgressIndicator();
              }
            },
          ): Image.file(
             file ,
            ),
          ),
          SizedBox(width: 8,),
           Expanded(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  fileName??"",
                  style: TextStyle(
                    color: Color(0xFF2970E4),
                    fontFamily: "ComicSansMS",
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "10-10-2023",
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontFamily: "ComicSansMS",
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "1:30",
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontFamily: "ComicSansMS",
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
                     ),
           ),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(child: SvgPicture.asset("assets/svg/share_black.svg")),
            SizedBox(width: 36,),
             InkWell(
               onTap: () => deleteImage(file),
                 child: SvgPicture.asset("assets/svg/remove.svg")),
             SizedBox(width: 16,),


          ],
        )
      ]),
    );
  }

   Future<Uint8List> _generateThumbnail(String videoPath) async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: videoPath,
     
      maxWidth: 200, // Chiều rộng tối đa của thumbnail
      quality: 25, // Chất lượng hình ảnh (từ 0 đến 100)
    );

    return uint8list!;
  }
}
