import 'dart:convert';

import 'package:bidder/data/model/models.dart';
import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'homeitems_event.dart';
part 'homeitems_state.dart';

class HomeitemsBloc extends Bloc<HomeitemsEvent, HomeitemsState> {
  HomeitemsBloc({
    required this.bidderRepository,
    required this.authenticationBloc,
  }) : super(HomeitemsState()) {
    on<FetchAll>(_onFetchAll);
  }

  final BidderRepository bidderRepository;
  final AuthenticationBloc authenticationBloc;

  void _onFetchAll(
    FetchAll event,
    Emitter<HomeitemsState> emit,
  ) async {
    switch (event.choice) {
      case SelectionType.all:
        emit(state.copyWith(status: HomeitemsStatus.loading));

        try {
          final fetchAllProductResponse =
              await bidderRepository.fetchAllProducts();

          emit(state.copyWith(
            status: HomeitemsStatus.success,
            products: fetchAllProductResponse,
          ));
        } catch (e) {
          print(e);
          emit(state.copyWith(status: HomeitemsStatus.failure));
        }

        return;
      case SelectionType.favorites:

      case SelectionType.myAuction:
    }
  }
}
