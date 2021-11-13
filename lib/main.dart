import 'package:connectivity/connectivity.dart';
import 'package:exhibit/data/util/colors.dart';
import 'package:exhibit/screens/main/bloc/main_screen_bloc.dart';
import 'package:exhibit/screens/main/main_screen.dart';
import 'package:exhibit/screens/no_internet/no_internet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/util/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainScreenBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Exhibit App',
        theme: ThemeData(
          primaryColor: MyColors.primaryColor,
        ),
        home: Builder(
          builder: (context) {
            return StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (BuildContext context,
                  AsyncSnapshot<ConnectivityResult> snapshot) {
                print(snapshot.data);
                if (!snapshot.hasData ||
                    snapshot.data == ConnectivityResult.none) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (_) => const NoInternetScreen(),
                      ),
                    );
                  });
                }
                return const MainScreen();
              },
            );
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
