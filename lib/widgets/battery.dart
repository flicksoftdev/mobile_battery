// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Battery extends StatelessWidget {
  final double size;
  final Color inActiveColor;
  final Color? activeColor;
  final double value;

  Battery({
    Key? key,
    this.inActiveColor = Colors.black12,
    this.activeColor,
    // this.height = 25,
    this.size = 72,
    this.value = 0,
  })  : assert(value >= 0 && value <= 100, 'Value must be between (0 to 100)%'),
        super(key: key);

  late double _height, _cellWidth;

  @override
  Widget build(BuildContext context) {
    _height = size / 2.5;
    _cellWidth = size - (size / 2.88) / (2 * 2 * 3) - _height / (2 * 2.5);

    return SizedBox(
      height: _height,
      width: size,
      // + (size / 2.88) / (2 * 2 * 3) + _height / (2 * 2.5)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(size / 18.5),
            child: Stack(
              children: [
                Container(
                  height: _height,
                  width: _cellWidth,
                  decoration: BoxDecoration(
                    color: inActiveColor,
                  ),
                ),
                SizedBox(
                  height: _height,
                  width: value / 100 * _cellWidth,
                  child: Container(
                    height: _height,
                    width: value,
                    decoration: BoxDecoration(
                      color: activeColor ?? _batteryColor(value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: (size / 2.88) / (2 * 2 * 3)),
          Container(
            height: _height / 2,
            width: _height / (2 * 2.5),
            decoration: BoxDecoration(
              color: inActiveColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(size / 18.5),
                topRight: Radius.circular(size / 18.5),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color _batteryColor(double value) {
    if (value >= 70) {
      return const Color(0xff43C2AE);
    } else if (value >= 45) {
      return const Color(0xffF2C445);
    } else if (value >= 25) {
      return const Color(0xffF28247);
    } else {
      return const Color(0xffF25147);
    }
  }
}
