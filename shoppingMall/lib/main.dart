import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingMall/core/viewmodel/goods_view_model.dart';
import 'package:shoppingMall/ui/cart/cart.dart';
import 'package:shoppingMall/ui/category/category.dart';
import 'package:shoppingMall/ui/home/home.dart';
import 'package:shoppingMall/ui/mine/mine.dart';
import 'package:shoppingMall/core/extension/int_extension.dart';
import 'package:shoppingMall/ui/widget/router/router.dart';
import 'package:shoppingMall/ui/widget/theme/app_theme.dart';
import 'package:shoppingMall/ui/widget/shared/size_fit.dart';


main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SHGoodsViewModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HYSizefit.initialize();

    return MaterialApp(
      title: "Flutter Demo",
      theme: SHAppTheme.normalTheme,
      darkTheme: SHAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes:SHRouter.routes,
      initialRoute: SHRouter.initialRoute,
    );
  }
}

class SHHomePage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _SHHomePageState createState() => _SHHomePageState();
}

class _SHHomePageState extends State<SHHomePage> with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          SHHomeScreen(),
          SHCategoryScreen(),
          SHCartScreen(),
          SHMineScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.amber,
        selectedFontSize: 14.px,
        unselectedFontSize: 14.px,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("分类")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("购物车")),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("我的")),
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}