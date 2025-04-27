import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prat/generated/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  _go(){
    Future.delayed((Duration(seconds: 3))).then((c){
      Router.neglect(context, ()=> context.go('/signIn'));
    });
  }

  @override
  void initState() {
    _go();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return  Scaffold(
      body: Container(
       height: size.height,
       width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Assets.assetsSplash))
        ),
      ),
    );
  }
}
