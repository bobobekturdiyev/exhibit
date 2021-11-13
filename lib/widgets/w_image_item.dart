import 'package:exhibit/data/util/colors.dart';
import 'package:exhibit/widgets/w_error_image.dart';
import 'package:flutter/material.dart';

class WImageItem extends StatelessWidget {
  final double marginRight;
  final double marginLeft;
  final String imageUrl;
  const WImageItem({
    Key? key,
    required this.imageUrl,
    this.marginRight = 16,
    this.marginLeft = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: EdgeInsets.only(
        right: marginRight,
        left: marginLeft,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.gray.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const WErrorImage();
          },
        ),
      ),
    );
  }
}
