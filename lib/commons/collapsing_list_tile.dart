import 'package:flutter/material.dart';
import 'package:sidebar/theme.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController controller;
  final bool isSelected;
  final Function onTap;

  CollapsingListTile({@required this.title, @required this.icon, @required this.controller, @required this.isSelected = false, this.onTap});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> widthAnimation;
  Animation<double> boxAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widthAnimation = Tween<double>(begin: 200.0, end: 70.0).animate(widget.controller);
    boxAnimation = Tween<double>(begin: 10.0, end: 0.0).animate(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected ? Colors.transparent.withOpacity(0.3) : Colors.transparent
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon, 
              color: widget.isSelected ? selectedColor : Colors.white30, 
              size: 38.0 
            ),
            SizedBox(width: boxAnimation.value),
            (widthAnimation.value >= 200) 
              ? Text(
                widget.title, 
                style: widget.isSelected ? listTitleSelectedTextStyle : listTitleDefaultTextStyle
              ) : Container()
          ],
        ),
      ),
    );
  }
}