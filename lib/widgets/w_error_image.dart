import 'package:exhibit/data/util/colors.dart';
import 'package:exhibit/data/util/styles.dart';
import 'package:flutter/material.dart';

class WErrorImage extends StatelessWidget {
  const WErrorImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: const Text(
        "URL is broken",
        style: MyTextStyle.errorText,
      ),
      color: MyColors.danger,
    );
  }
}
