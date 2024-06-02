import 'package:flutter/material.dart';
import 'package:smartpay/widgets_utils/app_colors.dart';
import 'package:smartpay/widgets_utils/app_text.dart';
import 'package:smartpay/widgets_utils/spacing.dart';

class CustomKeyboard extends StatefulWidget {
  final TextEditingController controller;

  const CustomKeyboard({super.key, required this.controller});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
          ],
        ),
        Spacing.sizedBox(height: 20),
        Row(
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
          ],
        ),
        Spacing.sizedBox(height: 20),
        Row(
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
          ],
        ),
        Spacing.sizedBox(height: 20),
        Row(
          children: [
            _buildButton('*'),
            _buildButton('0'),
            _buildButton('⌫', onPressed: _backspace),
          ],
        ),
      ],
    );
  }

  // 2
  // Individual keys
  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed ?? () => _input(text),
        child: AppText(
          text: text,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
    );
  }

  void _input(String text) {
    final value = _controller.text + text;
    _controller.text = value;
  }

  void _backspace() {
    final value = _controller.text;
    if (value.isNotEmpty) {
      _controller.text = value.substring(0, value.length - 1);
    }
  }
}
