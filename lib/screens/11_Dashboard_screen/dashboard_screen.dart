import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/routes/app_router.dart';
import 'package:ibiza/screens/11_Dashboard_screen/tab_screens/inbox_screen/indox_screen.dart';
import 'package:ibiza/screens/11_Dashboard_screen/tab_screens/listing_screen/listing_screen.dart';
import 'package:ibiza/screens/11_Dashboard_screen/tab_screens/menu_screens/insights/insights_screen.dart';

import 'tab_screens/menu_screens/earning_screen/earning_screen.dart';
import 'tab_screens/today_screen/today_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onPageChanged(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        bottom: TabBar(
          dividerColor: Colors.transparent,
          controller: _tabController,
          onTap: _onTabTapped,
          indicator: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
          tabs: [
            const Tab(text: 'Today'),
            const Tab(text: 'Listing'),
            const Tab(text: 'Inbox'),
            Tab(
                icon: PopupMenuButton<String>(
              splashRadius: 20.r,
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(AppColors.col064549)),
              // color: AppColors.colD0D5DD,
              onSelected: (String result) {
                if (result == 'Earnings') {
                  _pageController.animateToPage(3, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                } else if (result == 'Create a new listing') {
                  context.pushName(AppRoutes.addListingScreen);
                } else if (result == 'Reservations') {
                } else if (result == 'Insights') {
                  _pageController.animateToPage(4, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Create a new listing',
                  child: Text('Create a new listing'),
                ),
                const PopupMenuItem<String>(
                  value: 'Reservations',
                  child: Text('Reservations'),
                ),
                const PopupMenuItem<String>(
                  value: 'Earnings',
                  child: Text('Earnings'),
                ),
                const PopupMenuItem<String>(
                  value: 'Insights',
                  child: Text('Insights'),
                ),
              ],
              child: const Text('Menu'),
            )),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          TodayScreen(),
          ListingScreen(),
          InboxScreen(),
          EarningsScreen(),
          InsightScreen(),
        ],
      ),
    );
  }
}
