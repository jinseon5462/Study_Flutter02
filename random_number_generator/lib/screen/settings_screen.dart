import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;
  const SettingsScreen({required this.maxNumber, Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _SettingsScreenBody(
                maxNumber: maxNumber,
              ),
              _SettingsScreenFooter(
                onPressed: onButtonPressed,
                maxNumber: maxNumber,
                onSliderChanged: onSliderChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 슬라이더 값 변경시 setState로 maxNumber 변경
  void onSliderChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  // 저장 버튼 클릭 메서드
  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _SettingsScreenBody extends StatelessWidget {
  final double maxNumber;

  const _SettingsScreenBody({required this.maxNumber, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt(),
      ),
    );
  }
}

class _SettingsScreenFooter extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onPressed;

  const _SettingsScreenFooter({
    required this.onPressed,
    required this.maxNumber,
    required this.onSliderChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(backgroundColor: RED_COLOR),
            child: Text('저장!'),
          ),
        )
      ],
    );
  }
}
