import 'package:bidder/presentation/pages/home_page/widgets/Items/bloc/homeitems_bloc.dart';
import 'package:bidder/presentation/pages/home_page/widgets/Items/item_fetch_failed.dart';
import 'package:bidder/presentation/pages/home_page/widgets/Items/item_fetch_success.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemListingLayout extends StatelessWidget {
  const ItemListingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeitemsBloc, HomeitemsState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeitemsStatus.initial:
            case HomeitemsStatus.loading:
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: primaryColor,
                  color: secondaryColor,
                ),
              );
            case HomeitemsStatus.success:
              return const ItemFetchSuccess();
            case HomeitemsStatus.failure:
              return const ItemFetchFailed();
          }
        },
      ),
    );
  }
}
