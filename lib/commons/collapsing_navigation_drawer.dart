import 'package:flutter/material.dart';
import 'package:sidebar/commons/collapsing_list_tile.dart';
import 'package:sidebar/model/navigation_model.dart';
import 'package:sidebar/theme.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() => _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer> with SingleTickerProviderStateMixin {
  double maxWidth = 200.0;
  double minWidth = 70.0;
  bool isCollapsed = false;
  AnimationController _controller;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller, 
      builder: (context, widget) => getWidget(context, widget)
    );
  }

  Widget getWidget(context, widget){
    return Material(
      elevation: 10.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            // SizedBox(height: 50.0),
            CollapsingListTile(
              onTap: (){},
              isSelected: false,
              title:'Lionel Messi',
              icon: Icons.person,
              controller: _controller
            ),
            Divider(color: Colors.grey, height: 40.0),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter){
                  return Divider(height: 12.0);
                },
                itemBuilder: (context,counter){ 
                  return CollapsingListTile(
                    onTap: (){
                      setState((){
                        currentSelectedIndex = counter;
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    controller: _controller
                  );
                },
                itemCount: navigationItems.length
                ),
            ),
            InkWell(
              onTap: (){
                setState((){
                  isCollapsed = !isCollapsed;
                  isCollapsed ? _controller.forward() : _controller.reverse();
                });
              } ,
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _controller,
                color: Colors.white, 
                size: 30.0
              )
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}