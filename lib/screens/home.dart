import 'package:flutter/material.dart';
import 'package:foxbred/services/authentication.dart';
import 'package:foxbred/screens/profile.dart';

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
        decoration: new BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(this.contentPadding),
        child: Column(
          children: <Widget>[
            Container(
              height: pageHeight() / 2 - this.contentPadding - 22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[Text("top section")],
              ),
            ),
            Container(
              height: pageHeight() / 2 - this.contentPadding - 22,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Opacity(
                            opacity: 0.8,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: this.contentPadding / 2,
                                  right: this.contentPadding / 2,
                                  top: 0.0,
                                  bottom: this.contentPadding / 4),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double>
                                                  secondaryAnimation) =>
                                          Profile(callerKey: "left_top"),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black.withAlpha(70),
                                              offset: const Offset(3.0, 10.0),
                                              blurRadius: 15.0)
                                        ]),
                                    height: pageHeight() / 4 -
                                        this.contentPadding -
                                        (this.contentPadding / 4),
                                    child: Stack(
                                      children: <Widget>[
                                        Hero(
                                          tag: "left_top_background",
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Hero(
                                                      tag: "left_top_icon",
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withAlpha(
                                                                      70),
                                                              style: BorderStyle
                                                                  .solid,
                                                              width: 1.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Hero(
                                                            tag: "left_top_more_vert",
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
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
                                                      const EdgeInsets.only(
                                                          bottom: 8.0),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Hero(
                                                        tag: "left_top_number_of_tasks",
                                                        child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: Text(
                                                              "2 Tasks",
                                                              style:
                                                                  TextStyle(),
                                                              softWrap: false,
                                                            )),
                                                      ))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20.0),
                                                child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Hero(
                                                      tag: "left_top_title",
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: Text(
                                                          "",
                                                          style: TextStyle(
                                                              fontSize: 30.0),
                                                          softWrap: false,
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                              Hero(
                                                tag: "left_top_just_a_test",
                                                child: Material(
                                                  type:
                                                      MaterialType.transparency,
                                                  child: FadeTransition(
                                                    opacity:
                                                        AlwaysStoppedAnimation(
                                                            0.0),
                                                    child: ScaleTransition(
                                                      scale:
                                                          AlwaysStoppedAnimation(
                                                              0.0),
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
                          ),
                          Opacity(
                            opacity: 0.8,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: this.contentPadding / 2,
                                  right: this.contentPadding / 2,
                                  top: this.contentPadding / 4,
                                  bottom: 0.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double>
                                                  secondaryAnimation) =>
                                          Profile(callerKey: "left_bottom"),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black.withAlpha(70),
                                              offset: const Offset(3.0, 10.0),
                                              blurRadius: 15.0)
                                        ]),
                                    height: pageHeight() / 4 -
                                        this.contentPadding -
                                        (this.contentPadding / 4),
                                    child: Stack(
                                      children: <Widget>[
                                        Hero(
                                          tag: "left_bottom_background",
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Hero(
                                                      tag: "left_bottom_icon",
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withAlpha(
                                                                      70),
                                                              style: BorderStyle
                                                                  .solid,
                                                              width: 1.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Hero(
                                                            tag: "left_bottom_more_vert",
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
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
                                                      const EdgeInsets.only(
                                                          bottom: 8.0),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Hero(
                                                        tag: "left_bottom_number_of_tasks",
                                                        child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: Text(
                                                              " Tasks",
                                                              style:
                                                                  TextStyle(),
                                                              softWrap: false,
                                                            )),
                                                      ))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20.0),
                                                child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Hero(
                                                      tag: "left_bottom_title",
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: Text(
                                                          "",
                                                          style: TextStyle(
                                                              fontSize: 30.0),
                                                          softWrap: false,
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                              Hero(
                                                tag: "left_bottom_just_a_test",
                                                child: Material(
                                                  type:
                                                      MaterialType.transparency,
                                                  child: FadeTransition(
                                                    opacity:
                                                        AlwaysStoppedAnimation(
                                                            0.0),
                                                    child: ScaleTransition(
                                                      scale:
                                                          AlwaysStoppedAnimation(
                                                              0.0),
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
                          ),
                        ],
                      ),
                    ),
                     Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: this.contentPadding / 2,
                            right: this.contentPadding / 2,
                            top: 0.0,
                            bottom: 0.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) =>
                                    Profile(callerKey: "right"),
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
                                    tag: "right_background",
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Hero(
                                                tag: "right_icon",
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withAlpha(70),
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Hero(
                                                      tag: "right_more_vert",
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        type: MaterialType
                                                            .transparency,
                                                      ),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Hero(
                                                  tag: "right_number_of_tasks",
                                                  child: Material(
                                                      color: Colors.transparent,
                                                      child: Text(
                                                        "Profile",
                                                        style: TextStyle(),
                                                        softWrap: false,
                                                      )),
                                                ))),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Hero(
                                                tag: "right_title",
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontSize: 30.0),
                                                    softWrap: false,
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Hero(
                                          tag: "right_just_a_test",
                                          child: Material(
                                            type: MaterialType.transparency,
                                            child: FadeTransition(
                                              opacity:
                                                  AlwaysStoppedAnimation(0.0),
                                              child: ScaleTransition(
                                                scale:
                                                    AlwaysStoppedAnimation(0.0),
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
                  ]),
            )
          ],
        ),
      ),
    );
  }

  AppBar creatAppBar() {
    return AppBar(
      title: new Text('Flutter login demo'),
      elevation: 0.0,
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