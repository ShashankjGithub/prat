import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prat/pages/auth/bloc/loginBloc.dart';
import 'package:prat/pages/auth/bloc/loginResponse.dart';
import 'package:prat/routes.dart';
import 'package:prat/theme/themeConfig.dart';


void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  final LoginRepository repository = LoginRepository();
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (_) => LoginBloc(repository),
          child: MaterialApp.router(
              routerConfig: router,
              theme: themeData
          ),
        );
      },

    );
  }
}

