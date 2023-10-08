import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('the login link is sent to registered mail'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(219, 152, 48, 208),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter your Registered email to  Reset the Password',
            style: TextStyle(
              color: Color.fromARGB(219, 152, 48, 208),
              fontSize: 17,
              fontWeight: FontWeight.bold,

            ),
            ),
            
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: Container(
                decoration: BoxDecoration(
                   boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(124, 61, 23, 84),
                      spreadRadius: 5,
                      blurRadius: 9,
                      offset: Offset(0, 1))
                ],
                  color: const Color.fromARGB(139, 186, 42, 208),
                  border: Border.all(
                      color: const Color.fromARGB(195, 186, 42, 208)),
                ),
                
                child: TextField(
                  
                  controller: _emailController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(195, 186, 42, 208),
                      ),
                      
                    ),
                    border: InputBorder.none,
                    
                    
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                     prefixIcon: const Icon(Icons.email),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            MaterialButton(
              onPressed: passwordReset,
              color: const Color.fromARGB(195, 186, 42, 208),
              child: const Text('Reset Password',
              style: TextStyle(
                color: Color.fromARGB(255, 252, 252, 252)
              ),
              ),
            ),
          
          ],
        ));
  }
}
