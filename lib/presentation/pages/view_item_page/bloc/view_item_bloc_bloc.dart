import 'package:bidder/data/model/backend/bidder.dart';
import 'package:bidder/data/model/backend/product.dart';
import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_item_bloc_event.dart';
part 'view_item_bloc_state.dart';

class ViewItemBlocBloc extends Bloc<ViewItemBlocEvent, ViewItemBlocState> {
  Product product;
  ViewItemBlocBloc({
    required this.bidderRepository,
    required this.product,
  }) : super(ViewItemBlocState(
          product: product,
        )) {
    on<OnPlaceBid>(_onPlaceBid);
    on<OnFetchBidders>(_onFetchBidders);
  }

  final BidderRepository bidderRepository;

  void _onPlaceBid(
    OnPlaceBid event,
    Emitter<ViewItemBlocState> emit,
  ) async {
    emit(state.copyWith(placeBidStatus: PlacebidStatus.loading));

    try {
      final placeBidResponse = await bidderRepository.placeBid(
        price: event.price,
        productId: event.productId,
        userId: event.userId,
      );

      emit(state.copyWith(
        placeBidStatus: PlacebidStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(placeBidStatus: PlacebidStatus.failure));
    }
  }

  void _onFetchBidders(
    OnFetchBidders event,
    Emitter<ViewItemBlocState> emit,
  ) async {
    emit(state.copyWith(biddersStatus: BiddersStatus.loading));

    try {
      final fetchAllBidderResponse = await bidderRepository.fetchBidders(
        productId: event.productId,
      );

      print(fetchAllBidderResponse);

      emit(state.copyWith(
        bidders: fetchAllBidderResponse,
        biddersStatus: BiddersStatus.success,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(placeBidStatus: PlacebidStatus.failure));
    }
  }
}
