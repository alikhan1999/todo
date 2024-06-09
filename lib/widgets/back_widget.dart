import 'package:flutter/material.dart';
import 'package:todo/constant/style.dart';
import 'package:todo/constant/text_style/text_style.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0.0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios, color: Style.blackColor),
                  Text('Back', style: normalTextStyle),
                ],
              ),
            ),

            /*SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),*/
          ],
        ),
      ),
    );
  }
}
