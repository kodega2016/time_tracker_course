import 'package:flutter/material.dart';

class PElevatedButton extends StatelessWidget {
  const PElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        child: Text(label),
        onPressed: isDisabled ? null : onPressed,
      ),
    );
  }
}
