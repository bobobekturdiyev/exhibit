import 'package:exhibit/data/util/styles.dart';
import 'package:exhibit/widgets/w_item.dart';
import 'package:exhibit/widgets/w_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/main_screen_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          "Exhibit App",
          style: MyTextStyle.appBar,
        ),
      ),
      body: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if (state.isLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => WItem(
                exhibit: state.exhibitList[index],
              ),
              itemCount: state.exhibitList.length,
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const WItemShimmer(),
              itemCount: 4,
            );
          }
        },
      ),
    );
  }
}
