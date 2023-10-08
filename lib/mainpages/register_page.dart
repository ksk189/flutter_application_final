
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _contactnumberController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _contactnumberController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'welcome to ekisaan App🧑‍🌾',
                  style: TextStyle(
                    color: Color.fromARGB(163, 123, 14, 186),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    height: -1,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Register below with your details! 📄',
                  style: TextStyle(
                    color: Color.fromARGB(163, 123, 14, 186),
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    height: -1,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(224, 255, 254, 254),
                      border: Border.all(
                          color: const Color.fromARGB(166, 5, 0, 0)),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: TextField(
                      controller: _emailController,

                      cursorColor: const Color.fromARGB(255, 14, 0, 0),
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(150)),
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(235, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(
                          color: const Color.fromARGB(147, 17, 1, 1)),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _firstnameController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(150)),
                        hintText: 'first name',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(220, 8, 7, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(235, 248, 247, 247),
                      border: Border.all(
                          color: const Color.fromARGB(147, 6, 0, 0)),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _lastnameController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(150)),
                        hintText: 'last name',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(213, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(235, 255, 255, 255),
                      border: Border.all(
                          color: const Color.fromARGB(149, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(150)),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(220, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(249, 255, 253, 253),
                      border: Border.all(
                          color: const Color.fromARGB(179, 19, 1, 1)),
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _confirmpasswordController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(150)),
                        hintText: 'confirm password',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(217, 2, 2, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(237, 255, 254, 254),
                      border: Border.all(
                          color: const Color.fromARGB(179, 20, 0, 0)),
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _contactnumberController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(150)),
                        hintText: 'Contact number',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(217, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(225, 123, 14, 186),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I am  a member?',
                      style: TextStyle(
                        color: Color.fromARGB(163, 123, 14, 186),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        '  Login now',
                        style: TextStyle(
                          color: Color.fromARGB(163, 123, 14, 186),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
