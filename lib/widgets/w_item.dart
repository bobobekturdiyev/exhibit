import 'package:exhibit/data/util/styles.dart';
import 'package:exhibit/models/exhibit/exhibit.dart';
import 'package:exhibit/widgets/w_images.dart';
import 'package:flutter/material.dart';

class WItem extends StatelessWidget {
  final Exhibit exhibit;

  const WItem({
    Key? key,
    required this.exhibit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              exhibit.title,
              style: MyTextStyle.title,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          WImages(
            images: exhibit.images,
          ),
        ],
      ),
    );
  }
}
