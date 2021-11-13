part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

class LoadList extends MainScreenEvent {
  @override
  List<Object?> get props => [];
}
