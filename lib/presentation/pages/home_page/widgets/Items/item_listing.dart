import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/home_page/widgets/Items/bloc/homeitems_bloc.dart';
import 'package:bidder/presentation/pages/home_page/widgets/Items/item_listing_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemListing extends StatelessWidget {
  const ItemListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeitemsBloc(
        bidderRepository: RepositoryProvider.of<BidderRepository>(context),
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
      )..add(const FetchAll(choice: SelectionType.all)),
      child: const ItemListingLayout(),
    );
  }
}
