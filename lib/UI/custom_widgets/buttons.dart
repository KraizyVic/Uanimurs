import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonName;
  final bool isFilled;
  final VoidCallback onTap;
  const CustomTextButton({
    super.key,
    this.isFilled = false,
    required this.onTap,
    required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(10)
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(0),
        elevation: 0,
        onPressed: onTap,
        color: isFilled?Theme.of(context).colorScheme.primary:Colors.transparent,
        child: Text(buttonName),
      ),
    );
  }
}
