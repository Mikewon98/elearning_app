import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learningapp/common/values/colors.dart';
import 'package:learningapp/pages/home/home_page.dart';
import 'package:learningapp/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    Center(child: Text("Search")),
    Center(child: Text("Course")),
    Center(child: Text("Chat")),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "Home",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        width: 15.w,
        height: 15.h,
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        width: 15.w,
        height: 15.h,
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Course",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        width: 15.w,
        height: 15.h,
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Chat",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        width: 15.w,
        height: 15.h,
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/person2.png"),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        width: 15.w,
        height: 15.h,
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
