import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bidder/presentation/pages/sign_up_page/bloc/sign_up_bloc.dart';
import 'package:bidder/presentation/pages/sign_up_page/sign_up_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        bidderRepository: RepositoryProvider.of<BidderRepository>(context),
      ),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('SignUp Failure')),
              );
          }

          if (state.status.isSubmissionSuccess)  {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Successfully Signed up'),
                ),
              );

              // Future.delayed(Duration(seconds: 5));

              Navigator.pushReplacementNamed(context, '/login');

          }
        },
        child: const SignUpPageLayout(),
      ),
    );
  }
}
