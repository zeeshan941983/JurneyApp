import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ibiza/core/api/endpoints.dart';
import 'package:ibiza/core/api/requests.dart';
import 'package:ibiza/core/constants/constants.dart';

import 'package:ibiza/core/routes/app_router.dart';
import 'package:ibiza/core/widgets/app_button.dart';
import 'package:ibiza/core/widgets/custom_loader.dart';
import 'package:ibiza/screens/01_splas_screen/provider/slash_provider.dart';
import 'package:ibiza/screens/02_login_screen/provider/login_provider.dart';
import 'package:ibiza/screens/04_home_screen/provider/home_provider.dart';
import 'package:ibiza/screens/07_account_screen/provider/account_provider.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final gContext = navigatorKey.currentState!.context;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SplashProvider()),
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => AccountProvider()),
          ChangeNotifierProvider(create: (_) => ServiceProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: 'IBIZA Journey',
          theme: ThemeData(
            fontFamily: outfit,
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF1E99A1)),
            useMaterial3: true,
          ),
          initialRoute: '/',
          onGenerateRoute: AppRoutes.generateRoutes,
          // home: Checkdata(),
        ),
      ),
    );
  }
}

class Checkdata extends StatefulWidget {
  const Checkdata({super.key});

  @override
  State<Checkdata> createState() => _CheckdataState();
}

class _CheckdataState extends State<Checkdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Consumer<HomeProvider>(
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  value.logoutUser(context);
                },
                child: Text("data"))
          ],
        ),
      )),
    );
  }
}

class TestingAPIs extends StatefulWidget {
  const TestingAPIs({super.key});

  @override
  State<TestingAPIs> createState() => _TestingAPIsState();
}

class _TestingAPIsState extends State<TestingAPIs> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loading == false
              ? AppButton(
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });
                    final data = await APIRequests.makePostRequest(
                      Endpoints.register,
                      {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        // 'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lIjoiU3VuIEp1biAzMCAyMDI0IDExOjU2OjMzIEdNVCswMDAwIChDb29yZGluYXRlZCBVbml2ZXJzYWwgVGltZSkiLCJ1c2VySWQiOiI2NjgxNDdmMTU3OTE0MGFjYTBlOTY3M2MiLCJpYXQiOjE3MTk3NDg1OTN9.HFT-3Eb8Bo4hjyK2Ui5EIxz55CUP9f_wujXnsFznCWg',
                        'isAppUser': 'true',
                      },
                      {
                        'username': 'Ubaid Ullah',
                        'email': '@gmail.com',
                        'password': '12345678',
                        // 'token': '69586'
                      },
                      expectedStatus: 201,
                    );
                    log(data.toString());
                    setState(() {
                      loading = false;
                    });
                  },
                  text: 'Register User',
                )
              : const CircularProgressIndicator(),
          10.h.ph,
          AppButton(
              text: 'Delete User',
              onTap: () async {
                setState(() {
                  loading = true;
                });
                final data = await APIRequests.makeDeleteRequest(
                  Endpoints.register,
                  {
                    'Content-Type': 'application/x-www-form-urlencoded',
                    'Authorization': '',
                  },
                  {'email': 'ubaidxdev@gmail.com', 'password': '12345678'},
                );
                log(data.toString());
                setState(() {
                  loading = false;
                });
              })
        ],
      ),
    );
  }
}
