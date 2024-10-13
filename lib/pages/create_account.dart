import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/pages/login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordsMatch = false;
  bool _isSignUpButtonEnabled = false;

  void _validatePasswords() {
    setState(() {
      _passwordsMatch =
          _passwordController.text == _confirmPasswordController.text;
      _isSignUpButtonEnabled =
          _passwordsMatch && _passwordController.text.isNotEmpty;
    });
  }

  Future<bool> doesUserExist(
      {String? email, String? username, String? phone}) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection("users");

    QuerySnapshot emailQuerySnapshot;
    QuerySnapshot usernameQuerySnapshot;
    QuerySnapshot phoneQuerySnapshot;

    try {
      if (email != null && email.isNotEmpty) {
        emailQuerySnapshot =
            await users.where("email", isEqualTo: email).limit(1).get();
        if (emailQuerySnapshot.docs.isNotEmpty) {
          return true;
        }
      }

      if (username != null && username.isNotEmpty) {
        usernameQuerySnapshot =
            await users.where("username", isEqualTo: username).limit(1).get();
        if (usernameQuerySnapshot.docs.isNotEmpty) {
          return true;
        }
      }

      if (phone != null && phone.isNotEmpty) {
        phoneQuerySnapshot =
            await users.where("phone", isEqualTo: phone).limit(1).get();
        if (phoneQuerySnapshot.docs.isNotEmpty) {
          return true;
        }
      }
    } catch (e) {
      print("Error checking user existence: $e");
      return false;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 32,
                          color: Color.fromRGBO(103, 12, 13, 1.000),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Phone Number",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 10.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Email Address",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Username",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        _validatePasswords();
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorText:
                            !_passwordsMatch ? 'Passwords did not match' : null,
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        _validatePasswords();
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed:
                            _isSignUpButtonEnabled ? _handleSignUp : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isSignUpButtonEnabled
                              ? const Color.fromRGBO(103, 12, 13, 1.000)
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size(100, 50),
                        ),
                        child: const Text(
                          "Sign-up",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Color.fromRGBO(255, 255, 255, 1.000),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              'Already have an account? Log in!',
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Color.fromRGBO(198, 22, 22, 100),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _createAccount() async {
    DateTime now = DateTime.now().toUtc();
    DateTime nowUtc8 = now.add(const Duration(hours: 8));
    Timestamp createdAt = Timestamp.fromDate(nowUtc8);

    await db.collection("users").add({
      "phone": _phoneController.text.trim(),
      "email": _emailController.text.trim(),
      "username": _usernameController.text.trim(),
      "created_at": createdAt
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      return "User created successfully";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      }
    } catch (e) {
      print(e);
    }

    return "User created successfully";
  }

  Future<void> _handleSignUp() async {
    String phone = _phoneController.text.trim();
    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Checking...'),
          content: SizedBox(
            height: 60,
            child: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Expanded(child: Text('Checking user existence...')),
              ],
            ),
          ),
        );
      },
    );

    bool userExists =
        await doesUserExist(email: email, username: username, phone: phone);

    String result =
        "The email or username you entered already exists. Please try again with different credentials.";
    if (!userExists) {
      result = await _createAccount();
    }

    Navigator.of(context).pop();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: userExists
              ? const Text('User Already Exists')
              : const Text('Account Created'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (!userExists) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
