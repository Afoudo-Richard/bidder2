import 'package:bidder/data/data_provider/bidder_api.dart';
import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bidder/presentation/pages/add_item_page/add_item_page.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/favorites_page/favorites_page.dart';
import 'package:bidder/presentation/pages/login_page/login_page.dart';
import 'package:bidder/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:bidder/presentation/screens/main_screen.dart';
import 'package:bidder/presentation/widgets/custom_bottom_navigaiton_bar/cubit/bottomnavigationbar_cubit.dart';
import 'package:bidder/utils/system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final keyApplicationId = 'nOiWFINRWNaJDpHSpaKKZxRbtE1KiB8paZKKDWD2';
  final keyClientKey = 'B6swThWYlZwNTKumSLZDQmwN9go3BIYRNsFnOHer';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true, debug: true);

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: storage);

  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BidderRepository(bidderApi: BidderApi()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomnavigationbarCubit(),
          ),
          BlocProvider(
            create: (context) => AuthenticationBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Bidder',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Poppins',
          ),
          navigatorObservers: [routeObserver],
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/home': (context) => const MainScreen(),
            '/favorite': (context) => const FavoritesPage(),
            '/login': (context) => const LoginPage(),
            '/sign-up': (context) => const SignUpPage(),
            '/add-item': (context) => const AddItemPage(),
          },
        ),
      ),
    );
  }
}
