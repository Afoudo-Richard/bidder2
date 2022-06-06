part of 'homeitems_bloc.dart';

enum SelectionType { all, favorites, myAuction }

abstract class HomeitemsEvent extends Equatable {
  const HomeitemsEvent();

  @override
  List<Object> get props => [];
}

class FetchAll extends HomeitemsEvent {
  final SelectionType choice;

  const FetchAll({required this.choice});

  @override
  List<Object> get props => [choice];
}
