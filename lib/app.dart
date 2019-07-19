import 'package:flutter/material.dart';

import './demo/listview_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/basic_demo.dart';
import './demo/lay_out_demo.dart';
import './demo/sliver_demo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('hello fultter'.toUpperCase()),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'search',
                onPressed: () => debugPrint('search button is pressed'),
              )
            ],
            elevation: 3.0, // appbar 阴影值
            bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black45,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.view_quilt))
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListViewDemo(),
              BasicDemo(),
              LayoutDemo(),
              SliverDemo(),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('yuguangchao',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  accountEmail: Text('417937633@qq.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i1.hdslb.com/bfs/face/56e55b879c9160dc1a5ab0ba69e2aae49766c837.jpg'),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellow[400],
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://s1.hdslb.com/bfs/static/account-mobile/static/img/vip-year@2x.f155b99.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black12.withOpacity(0.3),
                            BlendMode.hardLight)),
                  ),
                ),
                ListTile(
                  title: Text('Messages', textAlign: TextAlign.right),
                  trailing:
                      Icon(Icons.message, color: Colors.black12, size: 22.0),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text('Favorite', textAlign: TextAlign.right),
                  trailing:
                      Icon(Icons.favorite, color: Colors.black12, size: 22.0),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text('Settings', textAlign: TextAlign.right),
                  trailing:
                      Icon(Icons.settings, color: Colors.black12, size: 22.0),
                  onTap: () => Navigator.pop(context),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBarDemo()),
    );
  }
}
