part of 'add_item_bloc.dart';

abstract class AddItemEvent extends Equatable {
  const AddItemEvent();

  @override
  List<Object> get props => [];
}

class AddItemCategoryChanged extends AddItemEvent {
  const AddItemCategoryChanged(this.category);

  final String category;

  @override
  List<Object> get props => [category];
}

class AddItemNameChanged extends AddItemEvent {
  const AddItemNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class AddItemDescriptionChanged extends AddItemEvent {
  const AddItemDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class AddItemPhoneChanged extends AddItemEvent {
  const AddItemPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class AddItemPriceChanged extends AddItemEvent {
  const AddItemPriceChanged(this.price);

  final String price;

  @override
  List<Object> get props => [price];
}

class AddItemAddBidTimeChanged extends AddItemEvent {
  const AddItemAddBidTimeChanged(this.addBidTime);

  final bool addBidTime;

  @override
  List<Object> get props => [addBidTime];
}

class AddItemBidStartTimeChanged extends AddItemEvent {
  const AddItemBidStartTimeChanged(this.time);

  final String time;

  @override
  List<Object> get props => [time];
}

class AddItemBidEndTimeChanged extends AddItemEvent {
  const AddItemBidEndTimeChanged(this.time);

  final String time;

  @override
  List<Object> get props => [time];
}

class AddItemSubmitted extends AddItemEvent {
  const AddItemSubmitted();
}

class SelectImages extends AddItemEvent {}

class CategoriesFetched extends AddItemEvent {}
