import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import '../config/index.dart';
import '../providers/current_index_provider.dart';

class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(KString.homeTitle),//首页
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text(KString.categoryTitle),//分类
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text(KString.shoppingCartTitle),//购物车
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text(KString.memberTitle),//会员中心
    ),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    //取到当前索引状态值
    int currentIndex = Provider.of<CurrentIndexProvider>(context).currentIndex;

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          Provider.of<CurrentIndexProvider>(context).changeIndex(index);
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children:tabBodies,
      ),
    );

  }

}