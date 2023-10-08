import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/mainpages/auth_service.dart';
import 'package:flutter_application_final/mainpages/forgotpw.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  final VoidCallback showRegisterPage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, colors: [
            Color.fromARGB(218, 155, 39, 176),
            Color.fromARGB(213, 123, 14, 186)
          ]),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.20,
                  bottom: 10,
                  left: 30),
              alignment: Alignment.topLeft,
              child: const Text(
                'Login..',
                style: TextStyle(
                  color: Color.fromARGB(248, 247, 244, 244),
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.27,
                  bottom: 20,
                  left: 30),
              alignment: Alignment.topLeft,
              child: const Text(
                'Welcome back..',
                style: TextStyle(
                  color: Color.fromARGB(255, 254, 254, 254),
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35),
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 254, 254),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(120, 109, 105, 109),
                      spreadRadius: 15,
                      blurRadius: 13,
                      offset: Offset(0, 3))
                ],
              ),
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 70, bottom: 30, left: 40, right: 40),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(131, 61, 23, 84),
                              spreadRadius: 5,
                              blurRadius: 9,
                              offset: Offset(0, 4)),
                        ]),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.email)),
                            )),
                        const Divider(
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: InputBorder.none,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      
                                    
                                    _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off
                                  
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ForgotPasswordPage();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 5, bottom: 5, left: 40),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Forgot password',
                        style: TextStyle(
                          color: Color.fromARGB(163, 123, 14, 186),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: logIn,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                          top: 20, bottom: 15, left: 40, right: 40),
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(170, 123, 14, 186),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(124, 61, 23, 84),
                            spreadRadius: 5,
                            blurRadius: 9,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(243, 240, 235, 235)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: const Text(
                        'Not a member : Register now ',
                        style: TextStyle(
                          color: Color.fromARGB(163, 123, 14, 186),
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: authService.hangleSignIn,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 40, right: 40),
                      padding: const EdgeInsets.all(9),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(239, 254, 254, 254),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(100, 61, 23, 84),
                            spreadRadius: 5,
                            blurRadius: 9,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 40),
                          SocialMediaButton(
                            iconData: SocialMediaIcons.google,
                            color: Color.fromARGB(160, 123, 14, 186),
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(177, 123, 14, 186)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
