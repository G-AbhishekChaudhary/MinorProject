import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'login.dart';
import 'sharedPref.dart';
import 'user.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name, email, phone, password, confirmpassword;

  SharedPref sharedPref = SharedPref();
  User userSave = User();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      child: Image.asset("images/register.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      maxLength: 25,
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.person, "Full Name"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter your Name';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        name = value;
                      },
                      onChanged: (value) {
                        setState(() {
                          userSave.name = value;
                        });
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.email, "Email"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please a Enter';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please enter a valid Email';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        email = value;
                      },
                      onChanged: (value) {
                        setState(() {
                          userSave.email = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(Icons.phone, "Phone No"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your phone no ';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        phone = value;
                      },
                      onChanged: (value) {
                        setState(() {
                          userSave.phoneno = value;
                        });
                      },
                    ),
                    TextFormField(
                      maxLength: 10,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.lock, "Password"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter your Password';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        password = value;
                      },
                      onChanged: (value) {
                        setState(() {
                          userSave.password = value;
                        });
                      },
                    ),
                    TextFormField(
                      maxLength: 10,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.lock, "Confirm Password"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please re-enter password';
                        }
                        if (password != confirmpassword) {
                          return "Password does not match";
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        confirmpassword = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: SizedBox(
                        width: 600,
                        height: 50,
                        child: ElevatedButton(
                          child: Text("Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              )),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white))),
                          ),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              sharedPref.save("user", userSave);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          new Text("Register Successfully"),
                                      duration:
                                          const Duration(milliseconds: 500)));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Login();
                              }));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          new Text("Not Register Successfully"),
                                      duration:
                                          const Duration(milliseconds: 500)));
                            }
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
