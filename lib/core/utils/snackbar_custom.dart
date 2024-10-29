import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class SnackbarCustom{
  String errorMessage;
  SnackbarCustom({required this.errorMessage});

   SnackBar showSnackbarError(){
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Stack(
          children: [
           
            Container(
              height: 48,
              decoration: const BoxDecoration(
                  color:  Color(0xFFF9ECEC),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: SvgPicture.asset("assets/svg/x-circle.svg"),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Color(0xFF2970E4),
                        fontFamily: "ComicSansMS",
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
             Container(
              height: 48,
              width: 5,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6)
                      )
                      ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
  }
}