import 'package:connectivity/connectivity.dart';
import 'package:exhibit/data/util/colors.dart';
import 'package:exhibit/data/util/styles.dart';
import 'package:exhibit/screens/main/bloc/main_screen_bloc.dart';
import 'package:exhibit/screens/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder:
          (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
        if (snapshot.data != null &&
            snapshot.hasData &&
            snapshot.data != ConnectivityResult.none) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            if (!context.read<MainScreenBloc>().isLoaded) {
              context.read<MainScreenBloc>().add(LoadList());
            }
            Navigator.of(context).pop();
          });
        } else {
          if (counter < 3) {
            WidgetsBinding.instance!.addPostFrameCallback((_) async {
              var connectivityResult =
                  await (Connectivity().checkConnectivity());
              if (connectivityResult == ConnectivityResult.mobile ||
                  connectivityResult == ConnectivityResult.wifi) {
                Navigator.of(context).pop();
              } else {
                setState(() {
                  counter++;
                });
              }
            });
          }
        }
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Container(
            color: MyColors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: MyColors.white,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      "Connection is lost",
                      style: MyTextStyle.title.copyWith(fontSize: 22),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                          Navigator.of(context).pop();
                        }
                      },
                      color: MyColors.primaryColor,
                      child: const Text(
                        "Re-Connect",
                        style: MyTextStyle.button,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
