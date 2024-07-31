import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/app_text.dart';
import 'package:ibiza/screens/07_account_screen/account_screen.dart';
import 'package:ibiza/screens/07_account_screen/provider/account_provider.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(
      builder: (context, provider, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.ph,
            AppText(
              text: "Account",
              fontSize: 26.sp,
              color: AppColors.col101828,
            ),
            RichText(
              text: TextSpan(
                  text: 'Welcome Hugo,',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: outfit,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                        text: 'You can edit and manage your experiences.',
                        style: TextStyle(
                          color: AppColors.col6A6A6A,
                          fontSize: 16.sp,
                          fontFamily: outfit,
                          fontWeight: FontWeight.w400,
                        ))
                  ]),
            ),
            16.ph,
            ...List.generate(
              cardList.length,
              (index) {
                return CustomContainer(
                  image: cardList[index].image,
                  title: cardList[index].title,
                  description: cardList[index].description,
                  onTap: () {
                    switch (cardList[index].title) {
                      case 'Personal Info':
                        provider.onCardClicked(1);
                        break;
                      case "Login & security":
                        provider.onCardClicked(2);
                        break;
                      case "Payment and Payout":
                        provider.onCardClicked(3);
                        break;
                    }
                  },
                );
              },
            ),
          ],
        ).withPadding(
            padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        )),
      ),
    );
  }
}
