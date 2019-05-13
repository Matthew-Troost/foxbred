import 'package:flutter/material.dart';
import 'package:foxbred/services/authentication.dart';

class Home extends StatefulWidget {
  Home({Key key, this.auth, this.userId, this.onSignedOut}) : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {

  double contentPadding = 20.00;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: creatAppBar(),
      body: Container(
        height: pageHeight() / 2,
        padding: EdgeInsets.all(this.contentPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: this.contentPadding / 2, right: this.contentPadding / 2, top: 0.0, bottom: this.contentPadding / 4),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) =>
                                DetailPage(),
                            transitionsBuilder: (
                              BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child,
                            ) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.0, 1.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: Offset.zero,
                                    end: const Offset(0.0, 1.0),
                                  ).animate(secondaryAnimation),
                                  child: child,
                                ),
                              );
                            },
                            transitionDuration:
                                const Duration(milliseconds: 500)));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withAlpha(70),
                                    offset: const Offset(3.0, 10.0),
                                    blurRadius: 15.0)
                              ]),
                          height: pageHeight() / 4 - this.contentPadding - (this.contentPadding / 4),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: "_background",
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Hero(
                                            tag: "_icon",
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey
                                                        .withAlpha(70),
                                                    style: BorderStyle.solid,
                                                    width: 1.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                                alignment: Alignment.topRight,
                                                child: Hero(
                                                  tag: "_more_vert",
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    type: MaterialType
                                                        .transparency,
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Hero(
                                              tag: "_number_of_tasks",
                                              child: Material(
                                                  color: Colors.transparent,
                                                  child: Text(
                                                    " Tasks",
                                                    style: TextStyle(),
                                                    softWrap: false,
                                                  )),
                                            ))),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Hero(
                                            tag: "_title",
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Text(
                                                "",
                                                style:
                                                    TextStyle(fontSize: 30.0),
                                                softWrap: false,
                                              ),
                                            ),
                                          )),
                                    ),
                                    Hero(
                                      tag: "_just_a_test",
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: FadeTransition(
                                          opacity: AlwaysStoppedAnimation(0.0),
                                          child: ScaleTransition(
                                            scale: AlwaysStoppedAnimation(0.0),
                                            child: Container(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: this.contentPadding / 2, right: this.contentPadding / 2, top: this.contentPadding / 4, bottom: 0.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) =>
                                DetailPage(),
                            transitionsBuilder: (
                              BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child,
                            ) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.0, 1.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: Offset.zero,
                                    end: const Offset(0.0, 1.0),
                                  ).animate(secondaryAnimation),
                                  child: child,
                                ),
                              );
                            },
                            transitionDuration:
                                const Duration(milliseconds: 500)));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withAlpha(70),
                                    offset: const Offset(3.0, 10.0),
                                    blurRadius: 15.0)
                              ]),
                          height: pageHeight() / 4 - this.contentPadding - (this.contentPadding / 4),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: "_background",
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Hero(
                                            tag: "_icon",
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey
                                                        .withAlpha(70),
                                                    style: BorderStyle.solid,
                                                    width: 1.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                                alignment: Alignment.topRight,
                                                child: Hero(
                                                  tag: "_more_vert",
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    type: MaterialType
                                                        .transparency,
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Hero(
                                              tag: "_number_of_tasks",
                                              child: Material(
                                                  color: Colors.transparent,
                                                  child: Text(
                                                    " Tasks",
                                                    style: TextStyle(),
                                                    softWrap: false,
                                                  )),
                                            ))),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Hero(
                                            tag: "_title",
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Text(
                                                "",
                                                style:
                                                    TextStyle(fontSize: 30.0),
                                                softWrap: false,
                                              ),
                                            ),
                                          )),
                                    ),
                                    Hero(
                                      tag: "_just_a_test",
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: FadeTransition(
                                          opacity: AlwaysStoppedAnimation(0.0),
                                          child: ScaleTransition(
                                            scale: AlwaysStoppedAnimation(0.0),
                                            child: Container(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child:  Padding(
                    padding: EdgeInsets.only(left: this.contentPadding / 2, right: this.contentPadding / 2, top: 0.0, bottom: 0.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) =>
                                DetailPage(),
                            transitionsBuilder: (
                              BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child,
                            ) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.0, 1.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: Offset.zero,
                                    end: const Offset(0.0, 1.0),
                                  ).animate(secondaryAnimation),
                                  child: child,
                                ),
                              );
                            },
                            transitionDuration:
                                const Duration(milliseconds: 500)));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withAlpha(70),
                                    offset: const Offset(3.0, 10.0),
                                    blurRadius: 15.0)
                              ]),
                          height: pageHeight() / 2,
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: "_background",
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Hero(
                                            tag: "_icon",
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey
                                                        .withAlpha(70),
                                                    style: BorderStyle.solid,
                                                    width: 1.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                                alignment: Alignment.topRight,
                                                child: Hero(
                                                  tag: "_more_vert",
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    type: MaterialType
                                                        .transparency,
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Hero(
                                              tag: "_number_of_tasks",
                                              child: Material(
                                                  color: Colors.transparent,
                                                  child: Text(
                                                    " Tasks",
                                                    style: TextStyle(),
                                                    softWrap: false,
                                                  )),
                                            ))),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Hero(
                                            tag: "_title",
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Text(
                                                "",
                                                style:
                                                    TextStyle(fontSize: 30.0),
                                                softWrap: false,
                                              ),
                                            ),
                                          )),
                                    ),
                                    Hero(
                                      tag: "_just_a_test",
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: FadeTransition(
                                          opacity: AlwaysStoppedAnimation(0.0),
                                          child: ScaleTransition(
                                            scale: AlwaysStoppedAnimation(0.0),
                                            child: Container(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
            )
          ],
        ),
      ),
    );
  }

  AppBar creatAppBar() {
    return AppBar(
      title: new Text('Flutter login demo'),
      actions: <Widget>[
        new FlatButton(
            child: new Text('Logout',
                style: new TextStyle(fontSize: 17.0, color: Colors.white)),
            onPressed: _signOut)
      ],
    );
  }

  double pageHeight() {
    
    return MediaQuery.of(context).size.height -
        creatAppBar().preferredSize.height;
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1.0),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //         <--- border radius here
          ),
    );
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
}

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  double percentComplete;
  AnimationController animationBar;
  double barPercent = 0.0;
  Tween<double> animT;
  AnimationController scaleAnimation;

  @override
  void initState() {
    scaleAnimation = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        lowerBound: 0.0,
        upperBound: 1.0);

    barPercent = percentComplete;
    animationBar = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100))
      ..addListener(() {
        setState(() {
          barPercent = animT.lerp(animationBar.value);
        });
      });
    animT = Tween<double>(begin: percentComplete, end: percentComplete);
    scaleAnimation.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: "_background",
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: "_icon",
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.grey.withAlpha(70),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: "_number_of_tasks",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          " Tasks",
                          style: TextStyle(),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: "_title",
                      child: Material(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
