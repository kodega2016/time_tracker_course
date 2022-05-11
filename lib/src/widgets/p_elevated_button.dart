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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              ),
            Text(label),
          ],
        ),
        onPressed: isDisabled ? null : onPressed,
      ),
    );
  }
}
