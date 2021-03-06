import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:Maberr/provider/user_provider.dart';
import 'package:Maberr/screens/callscreens/pickup/pickup_layout.dart';
import 'package:Maberr/screens/pageviews/chat_list_screen.dart';
import 'package:Maberr/utils/universal_variables.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int _page = 0;

  UserProvider userProvider;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.refreshUser();
    });

    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }


  @override
  Widget build(BuildContext context) {
    double _labelFontSize = 10;

    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      body: PageView(
        children: <Widget>[
          Center(child: Text("User", style: TextStyle(color: Colors.white),)),
          Center(child: Text("Livestream", style: TextStyle(color: Colors.white),)),
          Container(child: ChatListScreen(),),
          Center(child: Text("Shopping Cart", style: TextStyle(color: Colors.white),)),
          Center(child: Text("Search", style: TextStyle(color: Colors.white),)),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      
              
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle,
                    color: (_page == 0)
                        ? UniversalVariables.lightBlueColor
                        : UniversalVariables.greyColor),
                title: Text(
                  "User",
                  style: TextStyle(
                      fontSize: _labelFontSize,
                      color: (_page == 0)
                          ? UniversalVariables.lightBlueColor
                          : Colors.grey),
                ),
              ),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call,
                    color: (_page == 1)
                        ? UniversalVariables.lightBlueColor
                        : UniversalVariables.greyColor),
                title: Text(
                  "Livestream",
                  style: TextStyle(
                      fontSize: _labelFontSize,
                      color: (_page == 1)
                          ? UniversalVariables.lightBlueColor
                          : Colors.grey),
                ),
              ),
      BottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CupertinoTabBar(
            backgroundColor: UniversalVariables.blackColor,
            items: <BottomNavigationBarItem>[

                         BottomNavigationBarItem(
                icon: Icon(Icons.chat,
                    color: (_page == 2)
                        ? UniversalVariables.lightBlueColor
                        : UniversalVariables.greyColor),
                title: Text(
                  "Chats",
                  style: TextStyle(
                      fontSize: _labelFontSize,
                      color: (_page == 2)
                          ? UniversalVariables.lightBlueColor
                          : Colors.grey),
                ),
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart,
                    color: (_page == 3)
                        ? UniversalVariables.lightBlueColor
                        : UniversalVariables.greyColor),
                title: Text(
                  "Shopping Cart",
                  style: TextStyle(
                      fontSize: _labelFontSize,
                      color: (_page == 3)
                          ? UniversalVariables.lightBlueColor
                          : Colors.grey),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search,
                    color: (_page == 4)
                        ? UniversalVariables.lightBlueColor
                        : UniversalVariables.greyColor),
                title: Text(
                  "Search",
                  style: TextStyle(
                      fontSize: _labelFontSize,
                      color: (_page == 4)
                          ? UniversalVariables.lightBlueColor
                          : Colors.grey),
                ),
              ),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}