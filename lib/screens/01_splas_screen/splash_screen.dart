import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';

import 'package:ibiza/core/routes/app_router.dart';
import 'package:ibiza/screens/01_splas_screen/provider/slash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<SplashProvider>(context, listen: false);
      provider.setLoading(true);
      await provider.getUserData();
      Future.delayed(
        const Duration(seconds: 2),
        () => provider.token == null ? context.pushAndRemoveAll(AppRoutes.loginScreen) : context.pushAndRemoveAll(AppRoutes.homeScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: AppColors.col1E99A1,
        body: Stack(
          children: [
            AnimatedAlign(
              duration: Durations.extralong4,
              alignment: provider.isLoading ? Alignment.center : Alignment.bottomCenter,
              child: AnimatedOpacity(
                duration: Durations.extralong4,
                opacity: provider.isLoading ? 1 : 0,
                curve: Curves.bounceInOut,
                child: Image.asset(
                  AppImages.logoW,
                  scale: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
