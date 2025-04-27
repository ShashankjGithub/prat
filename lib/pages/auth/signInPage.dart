import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../coustomWidget/customTextField.dart';
import '../../coustomWidget/primeButton.dart';
import '../../generated/assets.dart';
import '../../theme/themeConfig.dart';
import '../../utlity/validators.dart';
import 'bloc/loginBloc.dart';
import 'bloc/loginEvent.dart';
import 'bloc/loginState.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginBloc, LoginState>(
  listener: (context, state) {
    if (state is LoginFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    }
    if (state is LoginSuccess) {
      context.go('/home',extra: state.userData);
    }
  },
  builder: (context, state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(

                text: "Don't have an account? ",
                children: [
                  TextSpan(
                      text: "Sign Up",
                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {})
                ]

            )),
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Stack(
                  children: [
                    Image.asset(Assets.assetsLoginH,height: 250,width: size.width,fit: BoxFit.cover,),
                    Image.asset(Assets.assetsSiC,height: 250,width: size.width,fit: BoxFit.cover,),

                  ],
                )),
            Positioned(
                bottom: size.height * 0.57,
                child: Stack(
                  children: [
                    Image.asset(Assets.assetsLoginline,height: 250,width: size.width,fit: BoxFit.cover,),

                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.r),
                          child: Image.asset(
                            Assets.assetsLogo,
                            height: 80.h,
                            width: 90.w,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Hello there, sign in to continue",
                        style: TextStyle(
                          color: const Color(0xff7c7c7c),
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 24.h),
                       CustomTextField(
                        clt: emailController,
                        validator: validateEmail,
                        hint: "Enter your email",
                        suffixIcon: Image.asset(Assets.assetsMail,width: 25.w,height: 20.h,),
                      ),
                      SizedBox(height: 16.h),
                       CustomTextField(
                        clt: passwordController,
                        hint: "Password",
                        obscureText: !showPassword,
                        validator: (c) => validateEmpty(c, "password"),

                        suffixIcon: InkWell(
                            onTap: (){
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            child: Icon(
                              !showPassword ? Icons.visibility_off :
                              Icons.visibility,color: mainColor,)),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            activeColor: Colors.amber,
                          ),
                          const Text("Remember me"),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Forgot password?"),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      state is LoginLoading
                      ?  CircularProgressIndicator(color: mainColor,):
                      PrimaryButton(
                        label: "SIGN IN",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(LoginButtonPressed(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ));
                          }
                        },
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
