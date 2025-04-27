import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:prat/coustomWidget/primeButton.dart';
import 'package:prat/theme/themeConfig.dart';

void showLogoutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return LogoutPopupWidget();
    },
  );
}

class LogoutPopupWidget extends StatelessWidget {
  const LogoutPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            'Are you sure you want to\nlogout?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(child: PrimaryButton(label: "Yes", onPressed: (){
                Router.neglect(context, ()=> context.go('/signIn'));
              },buttonColor: Colors.grey[200],textColor: Colors.black,)),
              SizedBox(width: 16),
              Expanded(child: PrimaryButton(label: "No", onPressed: (){
                context.pop();
              })),
            ],
          ),
        ],
      ),
    );
  }
}
