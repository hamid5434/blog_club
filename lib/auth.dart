import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'widgets/password_text_feild.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int LOGIN_INDEX = 0;
  static const int SIGNIN_INDEX = 1;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = LOGIN_INDEX;
                                });
                                print('currentIndex $currentIndex');
                              },
                              child: Text(
                                'Login'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: currentIndex == LOGIN_INDEX
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                                .withOpacity(.5)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = SIGNIN_INDEX;
                                });
                                print('currentIndex $currentIndex');
                              },
                              child: Text(
                                'Sign up'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: currentIndex == SIGNIN_INDEX
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                                .withOpacity(.5)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 32, right: 32, top: 20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: currentIndex == LOGIN_INDEX
                              ? _login()
                              : _signin(),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _login extends StatefulWidget {
  const _login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<_login> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 28,
          ),
          Text(
            'Well come back',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Sign in with your Account',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 18,
          ),
          TextField(
            decoration: InputDecoration(label: Text('Username')),
          ),
          const SizedBox(
            height: 8,
          ),
          PasswordTextFeild(),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 50),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: const Text('LOGIN'),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Forget your Password?'),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Reset here',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              'or sign in with '.toUpperCase(),
              style: TextStyle(
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.google.image(width: 36, height: 36),
              const SizedBox(
                width: 24,
              ),
              Assets.img.icons.facebook.image(width: 36, height: 36),
              const SizedBox(
                width: 24,
              ),
              Assets.img.icons.twitter.image(width: 36, height: 36),
            ],
          ),
        ],
      ),
    );
  }
}

class _signin extends StatefulWidget {
  const _signin({Key? key}) : super(key: key);

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<_signin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 28,
          ),
          Text(
            'Well come back',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Sign in with your Account',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 18,
          ),
          TextField(
            decoration: InputDecoration(label: Text('FullName')),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(label: Text('UserName')),
          ),
          const SizedBox(
            height: 8,
          ),
          PasswordTextFeild(),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 50),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Text('Sign In'.toUpperCase()),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'or sign in with '.toUpperCase(),
              style: TextStyle(
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.google.image(width: 36, height: 36),
              const SizedBox(
                width: 24,
              ),
              Assets.img.icons.facebook.image(width: 36, height: 36),
              const SizedBox(
                width: 24,
              ),
              Assets.img.icons.twitter.image(width: 36, height: 36),
            ],
          ),
        ],
      ),
    );
  }
}
