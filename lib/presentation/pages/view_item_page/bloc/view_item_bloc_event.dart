part of 'view_item_bloc_bloc.dart';

abstract class ViewItemBlocEvent extends Equatable {
  const ViewItemBlocEvent();

  @override
  List<Object> get props => [];
}

class OnPlaceBid extends ViewItemBlocEvent {
  final int price;
  final String productId;
  final String userId;
  const OnPlaceBid({
    required this.price,
    required this.productId,
    required this.userId,
  });

  @override
  List<Object> get props => [price, productId, userId];
}

class OnFetchBidders extends ViewItemBlocEvent {
  final String productId;
  const OnFetchBidders({
    required this.productId,
  });
}
