import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';

class ExtendableText extends StatefulWidget {
  final String text;
  const ExtendableText({super.key, required this.text});

  @override
  State<ExtendableText> createState() => _ExtendableTextState();
}

class _ExtendableTextState extends State<ExtendableText> {
  late String firstHalf;
  late String secondHalf;
  bool textHidden = true;
  double textHeight = MySizes.screenHeight / 5.63;

  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? MySmallText(
              text: firstHalf,
              size: MySizes.font16,
              color: MyColors.paraColor,
              height: 1.8,
            )
          : Column(
              children: [
                MySmallText(
                  text:
                      textHidden ? ('$firstHalf...') : (firstHalf + secondHalf),
                  size: MySizes.font16,
                  color: MyColors.paraColor,
                  height: 1.8,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      textHidden = !textHidden;
                    });
                  },
                  child: Row(
                    children: [
                      MySmallText(
                        text: textHidden ? 'Show more' : 'Show less',
                        color: MyColors.mainColor,
                      ),
                      Icon(
                        textHidden
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: MyColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
