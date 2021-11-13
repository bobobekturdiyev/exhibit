part of 'main_screen_bloc.dart';

class MainScreenState extends Equatable {
  final PostStatus status;
  final List<Exhibit> exhibitList;
  final bool isLoaded;
  const MainScreenState({
    this.status = PostStatus.normal,
    required this.exhibitList,
    this.isLoaded = false,
  });

  MainScreenState copyWith({
    PostStatus? status,
    List<Exhibit>? exhibitList,
    bool? isLoaded,
  }) =>
      MainScreenState(
        status: status ?? this.status,
        exhibitList: exhibitList ?? this.exhibitList,
        isLoaded: isLoaded ?? this.isLoaded,
      );

  @override
  List<Object> get props => [status, exhibitList, isLoaded];
}
