import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search by name or pet ID",
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.assetsSearch,height: 10,),
            ),
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}
