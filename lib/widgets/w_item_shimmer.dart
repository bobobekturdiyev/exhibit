import 'package:exhibit/data/util/colors.dart';
import 'package:exhibit/data/util/styles.dart';
import 'package:exhibit/widgets/w_images.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WItemShimmer extends StatefulWidget {
  const WItemShimmer({Key? key}) : super(key: key);

  @override
  _WItemShimmerState createState() => _WItemShimmerState();
}

class _WItemShimmerState extends State<WItemShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.shimmerBack,
      highlightColor: MyColors.shimmerLight,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              width: 135,
              height: 20,
              color: MyColors.gray,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 135,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 240,
                  margin: EdgeInsets.only(
                    right: 16,
                    left: index == 0 ? 16 : 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: MyColors.gray,
                  ),
                ),
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
