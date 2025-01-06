import 'package:college_hearts/common/components/navbar.dart';
import 'package:college_hearts/common/global.dart';
import 'package:college_hearts/screens/feed/feedScreen.dart';
import 'package:college_hearts/screens/matches/matches.dart';
import 'package:college_hearts/screens/messages/messagesScreen.dart';
import 'package:college_hearts/screens/profile/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login/backend.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Authentication>(context,listen: false);
    final List<Widget> screens=[
      Feedscreen(),
      MatchesScreen(),
      Messagesscreen(),
      ProfileScreen(userData:authProvider.userProfile!),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 80,
        width: MediaQuery.of(context).size.width,
        child: ValueListenableBuilder(
            valueListenable: selectedScreen, builder: (context, value, __) {
              return Center(child:screens[value]);
        }),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
