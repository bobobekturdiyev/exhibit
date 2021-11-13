import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exhibit/models/exhibit/exhibit.dart';
import 'package:exhibit/models/status/post_status.dart';
import 'package:exhibit/repository/exhibit_repository.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(const MainScreenState(exhibitList: [])) {
    on<LoadList>(_loadList);
    restExhibitsLoader = RestExhibitsLoader();
    add(LoadList());
  }

  late RestExhibitsLoader restExhibitsLoader;

  bool isLoaded = false;

  Future<FutureOr<void>> _loadList(
      LoadList event, Emitter<MainScreenState> emit) async {
    try {
      emit(
        state.copyWith(
          status: PostStatus.loading,
        ),
      );

      List<Exhibit> list = await restExhibitsLoader.getExhibitList();

      emit(
        state.copyWith(
          status: PostStatus.loaded,
          exhibitList: list,
          isLoaded: true,
        ),
      );
      isLoaded = true;
    } catch (e) {
      print(e);
    }
  }
}
