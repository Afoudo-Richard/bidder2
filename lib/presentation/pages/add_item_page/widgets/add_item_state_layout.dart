import 'package:bidder/presentation/pages/add_item_page/bloc/add_item_bloc.dart';
import 'package:bidder/presentation/pages/add_item_page/widgets/add_item_user_logged_in.dart';
import 'package:bidder/presentation/pages/add_item_page/widgets/failed_to_fetch.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemStateLayout extends StatelessWidget {
  const AddItemStateLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddItemBloc, AddItemState>(
      builder: (context, state) {
        switch (state.addItemstatus) {
          case AddItemStatus.initial:
          case AddItemStatus.loading:
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: primaryColor,
                color: secondaryColor,
              ),
            );
          case AddItemStatus.success:
            return const AddItemUserLoggedIn();
          case AddItemStatus.failure:
            return const FailedToFetch();
        }
      },
    );
  }
}
