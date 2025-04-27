import 'package:flutter/material.dart';
import 'package:prat/modal/dataModal.dart';
import 'package:prat/pages/home/widget/card.dart';
import 'package:prat/pages/home/widget/searchBar.dart';
import 'package:prat/pages/home/widget/topBar.dart';

import '../../theme/themeConfig.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.data});
  final Data data;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFEFE),
      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration:  BoxDecoration(
              color: Color(0xff00B4BF),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: const TopBar(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const SearchBarWidget(),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardCustom();
              },
            ),
          ),
        ],
      ),
    );
  }
}
