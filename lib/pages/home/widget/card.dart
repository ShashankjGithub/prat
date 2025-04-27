import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';


class CardCustom extends StatelessWidget {


  const CardCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black12)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 0.5),
                  image: DecorationImage(image: AssetImage(Assets.assetsLogo))
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("name",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(width: 10),
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Color(0xffDEE5FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Male',
                            style: TextStyle(fontSize: 12, color: Color(0xff6B8CFF)),
                          ),
                        ),
                      ],
                    ),
                    Text("ID: ${100}", style: TextStyle(color: Colors.grey[600])),
                    const SizedBox(height: 6),

                  ],
                ),
              )
            ],
          ),
          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoLabel("Mating date", "12/12/23"),
              _infoLabel("Breeding Partner", "EMMY"),
              _infoLabel("Pregnancy", "Y"),
            ],
          )
        ],
      ),
    );
  }

  Widget _infoLabel(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 12, color: Color(0xff999999),fontWeight: FontWeight.bold)),
        SizedBox(height: 5,),
        Text(value,
            style:  TextStyle(
                fontWeight: FontWeight.bold, fontSize: 13.sp)),
      ],
    );
  }
}
