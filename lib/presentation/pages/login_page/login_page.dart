import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/login_page/bloc/login_bloc.dart';
import 'package:bidder/presentation/pages/login_page/login_page_layout.dart';
import 'package:bidder/presentation/pages/user_profile_page/user_profile_page.dart';
import 'package:bidder/presentation/widgets/custom_bottom_navigaiton_bar/cubit/bottomnavigationbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    final state = context.read<AuthenticationBloc>().state;
    if (state.authenticated) {
      context
          .read<AuthenticationBloc>()
          .add(AuthenticationChecked(value: !(state.toggler)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previousState, currentState) {
        return true;
      },
      listener: (context, state) {
        print(state.authenticated);
        if (state.authenticated) {
          int value = context.read<BottomnavigationbarCubit>().state;
          switch (value) {
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const UserProfilePage();
                  },
                ),
              );
              break;
            default:
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
          }
        }
      },
      child: BlocProvider(
        create: (context) => LoginBloc(
          bidderRepository: RepositoryProvider.of<BidderRepository>(context),
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        ),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status.isSubmissionFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Authentication Failure')),
                );
            }

            if (state.status.isSubmissionSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Successfully login')),
                );
            }
          },
          child: const LoginPageLayout(),
        ),
      ),
    );
  }
}
