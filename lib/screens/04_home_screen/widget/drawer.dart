import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/routes/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E99A1),
      child: ListView(
        children: [
          draweheader(),
          20.ph,
          Container(
            height: 480.h,
            color: Colors.white,
            child: Column(
              children: [
                listTileData(
                  title: 'Trip',
                  icon: CupertinoIcons.bag,
                  onTap: () {},
                ),
                listTileData(
                  title: 'WishList`s',
                  icon: CupertinoIcons.star,
                  onTap: () {},
                ),
                listTileData(
                  title: 'Messages',
                  icon: CupertinoIcons.bubble_left_bubble_right,
                  onTap: () {},
                ),
                listTileData(
                  title: 'Account',
                  icon: CupertinoIcons.person,
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.accountScreen),
                ),
                listTileData(
                  title: 'Manage Listing',
                  icon: Icons.list,
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.listingView),
                ),
                listTileData(
                  title: 'Help Center',
                  icon: Icons.help,
                  onTap: () {},
                ),
                listTileData(
                  title: 'Logout',
                  icon: Icons.logout_outlined,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listTileData({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title),
      leading: Icon(
        icon,
        color: const Color(0xFF1E99A1),
      ),
      onTap: onTap,
    );
  }

  Widget draweheader() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 20, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/6.png'),
          ),
          10.ph,
          const Text('zeeshan',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('zeeshan@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              Icon(
                CupertinoIcons.bell,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
