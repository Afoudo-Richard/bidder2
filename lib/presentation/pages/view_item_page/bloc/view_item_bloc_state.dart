part of 'view_item_bloc_bloc.dart';

enum PlacebidStatus { intial, success, failure, loading }
enum BiddersStatus { intial, success, failure, loading }

class ViewItemBlocState extends Equatable {
  ViewItemBlocState({
    required this.product,
    this.placeBidStatus = PlacebidStatus.intial,
    this.biddersStatus = BiddersStatus.intial,
    this.bidders = const [],
  }) : currentBid = product.productPrice;
  final Product product;
  final PlacebidStatus placeBidStatus;
  final BiddersStatus biddersStatus;
  final List<Bidder> bidders;
  int currentBid;

  ViewItemBlocState copyWith({
    Product? product,
    PlacebidStatus? placeBidStatus,
    BiddersStatus? biddersStatus,
    List<Bidder>? bidders,
  }) {
    return ViewItemBlocState(
      product: product ?? this.product,
      placeBidStatus: placeBidStatus ?? this.placeBidStatus,
      biddersStatus: biddersStatus ?? this.biddersStatus,
      bidders: bidders ?? this.bidders,
    );
  }

  @override
  List<Object> get props => [product, placeBidStatus];
}
