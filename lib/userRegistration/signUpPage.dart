import 'package:classage/userRegistration/firebaseServices.dart';
import 'package:classage/userRegistration/professionPage.dart';
import 'package:flutter/material.dart';
import 'helper.dart';
import 'signInPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background2.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? Center(
                child: Container(
                  height: size.height / 20,
                  width: size.height / 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      topProgressIndicator(
                          MediaQuery.of(context).size.width / 3),
                      SizedBox(height: 20),
                      Text(
                        "Create an account",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                        child: TextFormField(
                          controller: _name,
                          keyboardType: TextInputType.name,
                          decoration: textFieldDecoration(Icon(Icons.person)),
                          validator: (_nameValue) {
                            if (_nameValue == null) {
                              return 'name required';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                        child: TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: textFieldDecoration(Icon(Icons.mail)),
                          validator: (_emailValue) {
                            RegExp regex = RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                            if (!regex.hasMatch(_emailValue)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 26),
                        child: TextFormField(
                          controller: _password,
                          decoration: textFieldDecoration(Icon(Icons.lock)),
                          obscureText: true,
                          validator: (_passwordValue) {
                            if (_passwordValue.isEmpty ||
                                _passwordValue == null) {
                              return 'Password is Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 80),
                      Container(
                        width: 300,
                        height: 72,
                        padding: EdgeInsets.all(8),
                        child: ElevatedButton(
                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_name.text.isNotEmpty &&
                                _email.text.isNotEmpty &&
                                _password.text.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ProfessionPage()),
                                  (Route<dynamic> route) => false);

                              await signUp(
                                      _name.text, _email.text, _password.text)
                                  .then((user) {
                                if (user != null) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  return ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          duration: Duration(microseconds: 300),
                                          backgroundColor:
                                              Colors.lightBlueAccent,
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text('Created Successfully'),
                                            ],
                                          )));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              Colors.lightBlueAccent,
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Oops login Failed'),
                                            ],
                                          )));
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.lightBlueAccent,
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Please enter fields'),
                                        ],
                                      )));
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 280,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: () async {
                            await signInWithGoogle();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProfessionPage()),
                                (Route<dynamic> route) => false);
                            return ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: Duration(microseconds: 300),
                                    backgroundColor: Colors.lightBlueAccent,
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Created Successfully'),
                                      ],
                                    )));

                            /*
                            signInWithGoogle();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProfessionPage()));*/
                          },
                          child: Text(
                            "Continue with Google",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 300,
                        color: Colors.white30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already registered? "),
                            TextButton(
                              child: Text(
                                "Login Here",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()),
                                    (Route<dynamic> route) => false);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
