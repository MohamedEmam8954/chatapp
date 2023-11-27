import 'dart:developer';
import 'dart:io';

import 'package:chatapp/auth/loginscreen.dart';
import 'package:chatapp/components/custombottom.dart';
import 'package:chatapp/components/cutomtextformfield.dart';
import 'package:chatapp/components/showdialog.dart';

import 'package:chatapp/screens/chatbubble.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signupscreen extends StatefulWidget {
  Signupscreen({super.key});
  static String id = "SignUp screen";

  @override
  State<Signupscreen> createState() => _Signupscreen();
}

class _Signupscreen extends State<Signupscreen> {
  bool check = false;
  bool obscoretext = true;
  var emailtextediting = TextEditingController();
  var passwordtextediting = TextEditingController();
  String? email, password;
  File? selected_image;

  var globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: globalkey,
              child: ClipPath(
                clipper: WaveClipperTwo(flip: true),
                child: Container(
                  width: double.infinity,
                  height: 550,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.pink.shade400,
                        Colors.blue.shade300,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        Image.asset(
                          "assets/image/logo.png",
                          width: 110,
                          height: 110,
                        ),
                        const Text(
                          "Chatty",
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontFamily: "Pacifico",
                          ),
                        ),
                        const Row(
                          children: [
                            Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Customtextformfield(
                          inputType: TextInputType.emailAddress,
                          hinttext: "Email",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email mus't be empty";
                            }
                            if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }

                            return null;
                          },
                          icon: Icons.person,
                          onsubmit: (value) {
                            email = value;
                            log(email!);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Customtextformfield(
                          obscuretext: obscoretext,
                          inputType: TextInputType.number,
                          hinttext: "Password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password mus't be empty";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          icon: Icons.lock,
                          onsubmit: (value) {
                            password = value;
                            log(password!);
                          },
                          suffixicon:
                              check ? Icons.visibility_off : Icons.visibility,
                          ontap: () {
                            setState(
                              () {
                                check = !check;
                                obscoretext = !obscoretext;
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Custombuttom(
                          size: double.infinity,
                          color: const Color(0xff000000).withOpacity(0.8),
                          text: "Sign up",
                          ontap: () async {
                            if (globalkey.currentState!.validate()) {
                              try {
                                UserCredential userCredential = await signup();

                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Loginscreen.id,
                                  (route) => false,
                                  arguments: email,
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code ==
                                    'The account already exists for that email') {
                                  log("The account already exists for that email");
                                } else if (e.code == 'email-already-in-use') {
                                  showdialog(context, 'email-already-in-use');
                                }
                              } catch (e) {
                                log(e.toString());
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              children: [
                Expanded(
                    child: Divider(
                  color: Colors.blue,
                  thickness: 1.5,
                  indent: 30,
                )),
                Text(
                  "OR continue with",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.blue,
                  thickness: 1.5,
                  endIndent: 30,
                ))
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/image/facebook.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () async {
                    await signInWithGoogle();
                  },
                  child: Image.asset(
                    "assets/image/Google.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "have an account? ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signup() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);

    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    return userCredential;
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushNamedAndRemoveUntil(context, chatbubble.id, (route) => false,
        arguments: googleUser.email);
  }
}
