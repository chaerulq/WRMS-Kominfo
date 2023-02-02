import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrms_kominfo/presentations/widgets/custom_button.dart';
import 'package:wrms_kominfo/utils/snake_message.dart';
import '../../../data/provider/auth.dart';
import 'animation_login.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _username.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                FadeAnimation(
                  0.8,
                  Container(
                    height: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          width: 80,
                          height: 200,
                          child: FadeAnimation(
                            1,
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-1.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-2.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 200,
                          child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: FadeAnimation(
                            1.7,
                            Container(
                              margin: const EdgeInsets.only(top: 50),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextField(
                                    controller: _username,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _password,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(height: 30),
                      FadeAnimation(
                        2,
                        Consumer<Authentication>(
                          builder: (context, auth, snapshot) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (auth.resMessage != '') {
                                showMessage(
                                    message: auth.resMessage, context: context);
                                auth.clear();
                              }
                            });
                            return customButton(
                              text: 'Login',
                              tap: () {
                                if (_username.text.isEmpty ||
                                    _password.text.isEmpty) {
                                  showMessage(
                                    message: 'All field are required',
                                    context: context,
                                  );
                                } else {
                                  auth.loginUser(
                                      username: _username.text.trim(),
                                      password: _password.text.trim(),
                                      context: context);
                                }
                              },
                              context: context,
                              status: auth.isLoading,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
