import 'package:flutter/material.dart';
import 'package:prat/generated/assets.dart';

import 'logoutPopup.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(Assets.assetsProfile),
            backgroundColor: Colors.transparent,
            radius: 25,
          ),
          const Spacer(),
          Image.asset(Assets.assetsClipcut,height: 35,),
          const Spacer(),
          InkWell(
              onTap: (){
                showLogoutBottomSheet(context);
              },
              child: Image.asset(Assets.assetsLogout,height: 30,))
        ],
      ),
    );
  }
}
