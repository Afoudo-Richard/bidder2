part of 'view_item_bloc_bloc.dart';

abstract class ViewItemBlocEvent extends Equatable {
  const ViewItemBlocEvent();

  @override
  List<Object> get props => [];
}

class Onplacebid extends ViewItemBlocEvent {}
