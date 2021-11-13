import 'package:exhibit/widgets/w_image_item.dart';
import 'package:flutter/material.dart';

class WImages extends StatelessWidget {
  final List<String> images;
  const WImages({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => WImageItem(
          imageUrl: images[index],
          marginLeft: index == 0 ? 16 : 0,
        ),
        itemCount: images.length,
      ),
    );
  }
}
