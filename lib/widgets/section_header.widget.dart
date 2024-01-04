import 'package:flutter/material.dart';
import 'package:login_screen_updated/utilities/colors.utilities.dart';
import 'package:login_screen_updated/utilities/padding_numbers.utilities.dart';

class SectionHeader extends StatelessWidget {
  final String sectionName;
  const SectionHeader({required this.sectionName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Numbers.appHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionName,
            style: const TextStyle(
                fontSize: 23,
                fontFamily: 'Hellix_Bold ',
                fontWeight: FontWeight.w900),
          ),
          GestureDetector(
            onTap: () {
              print('See All');
            },
            child: const Text(
              'See All',
              style: TextStyle(
                fontSize: 15,
                color: Color(ColorsConst.orangeColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
