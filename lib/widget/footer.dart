import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/appstate.dart';

class Footer extends StatefulWidget {
  final String menuOne;
  final String menuTwo;
  final String menuThree;
  final String menuFour;
  final IconData menuOneIcon;
  final IconData menuTwoIcon;
  // final Widget menuThreeIcon;
  final IconData menuFourIcon;
  
  Footer({
    this.menuOne,this.menuTwo,this.menuThree,this.menuOneIcon,this.menuTwoIcon,
    //this.menuThreeIcon,
    this.menuFour,this.menuFourIcon
  });

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  
  
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return BubbleBottomBar(
      opacity: 1,
      backgroundColor: Colors.white,
      
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0),

      ),
      currentIndex: appState.currentIndexFooter,
      hasInk: true,
      inkColor: Colors.black12,
      onTap: appState.changePage,
      
      items: <BubbleBottomBarItem>[
         
        BubbleBottomBarItem(

          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(

          this.widget.menuOneIcon,
            color: Theme.of(context).primaryColor,
          ),
          activeIcon: Icon(
         this.widget.menuOneIcon,
            color: Colors.white,
          ),
          title: Text(this.widget.menuOne,style: TextStyle(color: Colors.white)),
        ),
        BubbleBottomBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(
            this.widget.menuTwoIcon,
            color: Theme.of(context).primaryColor,
          ),
          activeIcon: Icon(
            this.widget.menuTwoIcon,
            color: Colors.white,
          ),
          title: Text(this.widget.menuTwo,style: TextStyle(color: Colors.white)),
        ),
        BubbleBottomBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: SvgPicture.asset("assets/svg/list.svg",width: 22,color: Theme.of(context).primaryColor,),
          activeIcon: SvgPicture.asset("assets/svg/list.svg",width: 22,color: Colors.white,),
          title: Text(this.widget.menuThree,style: TextStyle(color: Colors.white)),
        ),
        BubbleBottomBarItem(

          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(

          this.widget.menuFourIcon,
            color: Theme.of(context).primaryColor,
          ),
          activeIcon: Icon(
         this.widget.menuFourIcon,
            color: Colors.white,
          ),
          title: Text(this.widget.menuFour,style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
