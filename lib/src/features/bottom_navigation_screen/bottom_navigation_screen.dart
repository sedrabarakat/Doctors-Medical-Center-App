import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/patient_profile_screen.dart';
import 'package:doctor_app/src/features/posts/presentation/pages/new_post_screen.dart';
import 'package:doctor_app/src/features/posts/presentation/pages/posts_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final PageController _pageController = PageController();
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  //todo put the actual screens
  final List<Widget> bottomBarPages = [
    const Test1(),
    const Test2(),
    const Test3(),
    const PostsScreen(),
    const Test5(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: ColorsHelper.white,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 5,
        kBottomRadius: 0,
        notchColor: ColorsHelper.primary,
        removeMargins: true,
        showShadow: false,
        durationInMilliSeconds: 300,
        itemLabelStyle: StyleManager.fontMedium13.copyWith(
          color: const Color(0XFF8891A5),
        ),
        elevation: 1,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.home),
            activeItem: Icon(
              Icons.home,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.favorite),
            activeItem: Icon(
              Icons.favorite,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Favorite',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.call),
            activeItem: Icon(
              Icons.call,
              color: ColorsHelper.white,
            ),
            itemLabel: "Call",
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person),
            activeItem: Icon(
              Icons.person,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Profile',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.settings),
            activeItem: Icon(
              Icons.settings,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Settings',
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      ),
    );
  }
}

// todo delete this
class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Page 1",
          ),
        ),
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Page 2",
          ),
        ),
      ),
    );
  }
}

class Test3 extends StatelessWidget {
  const Test3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Page 3",
          ),
        ),
      ),
    );
  }
}

class Test4 extends StatelessWidget {
  const Test4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Page 4",
          ),
        ),
      ),
    );
  }
}

class Test5 extends StatelessWidget {
  const Test5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Page 5",
          ),
        ),
      ),
    );
  }
}
