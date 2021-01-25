import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    // constrained box
    final constrainedBox = ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 350, maxWidth: 350, minHeight: 150, minWidth: 150),
      child: Container(
        width: 10,
        height: 10,
        color: Colors.red,
        child: Center(
          child: Text("Constrained Box"),
        ),
      ),
    );

    final sizedBox = SizedBox(
      height: 100,
      width: 100,
      child: Container(
        child: Center(
          child: Text("Sized Box"),
        ),
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    );

    final rotatedBox = RotatedBox(
      quarterTurns: 3,
      child: ClipPath(
        child: Image(
          image: AssetImage("assets/crew.png"),
          height: 150.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
      ),
    );

    final button =
        FloatingActionButton(child: Icon(Icons.add), onPressed: null);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Our Demo",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.phone),
            label: 'Contact',
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40.0)),
            constrainedBox,
            Padding(padding: EdgeInsets.only(top: 60)),
            sizedBox,
            Padding(padding: EdgeInsets.only(top: 60)),
            button,
            Padding(padding: EdgeInsets.only(top: 60)),
            rotatedBox,
          ],
        ),
      ),
      drawer: NavigateDrawer(
        uid: this.uid,
      ),
    );
  }
}

// This is the Navigate Drawer section that will appear on the left hand
//side of the navbar. When the user opens it, it will reveal their name, account picture, and email.

class NavigateDrawer extends StatefulWidget {
  final String uid;
  NavigateDrawer({Key key, this.uid}) : super(key: key);
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Monkey D Luffy"),
            accountEmail: Text("kingofpirates@haki.org"),
            currentAccountPicture: CircleAvatar(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/luffy.png'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
