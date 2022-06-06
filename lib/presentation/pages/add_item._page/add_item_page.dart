import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bidder/presentation/pages/add_item._page/add_item_page_layout.dart';
import 'package:bidder/presentation/pages/add_item._page/bloc/add_item_bloc.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/user_profile_page/user_profile_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';



class AddItemPage extends StatelessWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddItemBloc(
        bidderRepository: RepositoryProvider.of<BidderRepository>(context),
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
      ),
      child: BlocListener<AddItemBloc, AddItemState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Failed to add Item')),
              );
          }

          if (state.status.isSubmissionSuccess)  {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Item added Successfully'),
                ),
              );

              // Future.delayed(Duration(seconds: 5));

              //Navigator.pushReplacementNamed(context, '/dashboard');

          }
        },
        child: const AddItemPageLayout(),
      ),
    );
  }
}