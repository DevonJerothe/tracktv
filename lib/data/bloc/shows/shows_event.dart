part of 'shows_bloc.dart';

@immutable
abstract class ShowsEvent {}

class Refresh extends ShowsEvent {}

class GetShowInfo extends ShowsEvent {}

class GetShowList extends ShowsEvent {
  GetShowList({
    this.type,
    this.limit,
    this.extended,
    this.context
  });

  ListCategory type;
  int limit;
  bool extended;
  BuildContext context;
}

