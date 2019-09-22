import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/generated/i18n.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../page_index.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool eye = true;

  void _toggle() {
    setState(() {
      eye = !eye;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 20, 0),
            child: FlatButton(
              child: Text(
                "${S.of(context).login}".toUpperCase(),
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              onPressed: () => pushNewPage(context, LoginPage()),
              highlightColor: Colors.black,
              shape: StadiumBorder(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "${S.of(context).register}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              Gaps.vGap40,
              TextField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  // hintText: "Email",
                  labelText: "${S.of(context).email}",
                ),
              ),
              Gaps.vGap20,
              TextField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: InputDecoration(
                  // hintText: "Email",
                  labelText: "${S.of(context).username}",
                ),
              ),
              Gaps.vGap20,
              TextField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "${S.of(context).password}",
                  suffixIcon: GestureDetector(
                    child: Icon(
                      eye ? Icons.visibility_off : Icons.visibility,
                    ),
                    onTap: _toggle,
                  ),
                ),
                obscureText: eye,
              ),
              Gaps.vGap20,
              Hero(
                tag: "button",
                child: Button(
                  text: "${S.of(context).register}",
                  textColor: Colors.white,
                  color: Colors.black,
                  borderRadius: 30,
                  disabledColor: Colors.white54,
                  onPressed: () {},
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(
                  "Or sign up with social account",
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Hero(
                      tag: "Facebook",
                      child: OutlineButton(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesome.facebook,
                              size: 20,
                            ),
                            Gaps.hGap5,
                            Text("Facebook",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        shape: StadiumBorder(),
                        highlightedBorderColor: Colors.black,
                        borderSide: BorderSide(color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Gaps.hGap20,
                  Expanded(
                    child: Hero(
                      tag: "Twitter",
                      child: OutlineButton(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesome.twitter,
                              size: 20,
                            ),
                            Gaps.hGap5,
                            Text("Twitter",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        shape: StadiumBorder(),
                        highlightedBorderColor: Colors.black,
                        borderSide: BorderSide(color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.vGap20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("By signing up you agree to our "),
                  GestureDetector(
                      child: Text("Terms of Use",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () {})
                ],
              ),
              Gaps.vGap5,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("and "),
                  GestureDetector(
                      child: Text("Privacy Policy",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}