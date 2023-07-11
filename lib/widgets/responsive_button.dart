import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isRenponsive;
  double? width;
  ResponsiveButton({
    super.key,
    this.width = 120,
    this.isRenponsive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isRenponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isRenponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isRenponsive == true
                ? Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: AppText(
                      text: 'Book Trip Now',
                      color: Colors.white,
                    ),
                  )
                : Container(),
            Image.asset('img/button-one.png'),
          ],
        ),
      ),
    );
  }
}
