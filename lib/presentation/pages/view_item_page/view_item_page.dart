import 'package:bidder/data/model/backend/product.dart';
import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bidder/presentation/pages/view_item_page/bloc/view_item_bloc_bloc.dart';
import 'package:bidder/presentation/pages/view_item_page/view_item_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewItemPage extends StatelessWidget {
  final Product product;
  const ViewItemPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewItemBlocBloc(
        bidderRepository: RepositoryProvider.of<BidderRepository>(context),
        product: product,
      )..add(OnFetchBidders(productId: product.id)),
      child: ViewItemPageLayout(
        product: product,
      ),
    );
  }
}
