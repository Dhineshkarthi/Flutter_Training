import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_screensharja/homescreen.dart';
import 'package:login_screensharja/surveypage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final tabs = [
    const HomeScreen(),
    const Center(
      child: Text('Event'),
    ),
    const SurveyScreen(),
    const Center(
      child: Text('More'),
    ),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assests/logoappbar.png',
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'AED',
                style: TextStyle(color: Colors.grey),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Colors.grey,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: Colors.grey,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.flag_outlined),
                color: Colors.grey,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.tv),
                color: Colors.grey,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: Colors.grey,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                color: Colors.grey,
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        body: tabs[index],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            child: GNav(
              selectedIndex: index,
              backgroundColor: Colors.white,
              color: Colors.grey,
              activeColor: Colors.lightBlue,
              tabBackgroundColor: const Color.fromARGB(255, 241, 236, 236),
              tabMargin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              gap: 5,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.event,
                  text: 'Event',
                ),
                GButton(
                  icon: Icons.emoji_emotions,
                  text: 'Survey',
                ),
                GButton(
                  icon: Icons.more_vert_rounded,
                  text: 'More',
                ),
              ],
              onTabChange: (currentIndex) {
                setState(() {
                  index = currentIndex;
                });
              },
            ),
          ),
        ));
  }
}
