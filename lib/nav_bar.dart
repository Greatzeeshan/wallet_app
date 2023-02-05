
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:wallet_app/screens/home_view/home_screen.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/constants.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {

 late PersistentTabController _controller;

 @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).bottomAppBarColor, 
        handleAndroidBackButtonPress: true, 
        resizeToAvoidBottomInset: true, 
        stateManagement: true, 
        hideNavigationBarWhenKeyboardShows: true, 
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          colorBehindNavBar: Theme.of(context).bottomAppBarColor, 
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( 
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( 
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15, 
    );
    
  }

   List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: SvgPicture.asset(homeSVG,),
                inactiveIcon: SvgPicture.asset(homeSVG,color: Colors.grey,),
            ),
             PersistentBottomNavBarItem(
                icon: SvgPicture.asset(graphSVG,color: ColorHelper.splashColor,),
                inactiveIcon: SvgPicture.asset(graphSVG,),
                
            ),
             PersistentBottomNavBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(scanPNG,color: ColorHelper.splashColor,),
                ),
                inactiveIcon:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(scanPNG,color: ColorHelper.white,),
                ),
                inactiveColorPrimary : ColorHelper.mainColor,
                activeColorPrimary: ColorHelper.mainColor,
                inactiveColorSecondary: ColorHelper.mainColor,
                activeColorSecondary: ColorHelper.mainColor
            ),
             PersistentBottomNavBarItem(
                activeColorPrimary: ColorHelper.splashColor,
                icon: SvgPicture.asset(chartSVG,color: ColorHelper.splashColor,),
                inactiveIcon: SvgPicture.asset(chartSVG,),
            ),
             PersistentBottomNavBarItem(
                activeColorPrimary: ColorHelper.splashColor,
                icon: SvgPicture.asset(profileSVG,color: ColorHelper.splashColor,),
                inactiveIcon: SvgPicture.asset(profileSVG,),
            ),
        ];
    }


  List<Widget> _buildScreens() {
        return [
          const HomeScreen(),
          Container(),
          Container(),
          Container(),
          Container(),
        ];
    }
}