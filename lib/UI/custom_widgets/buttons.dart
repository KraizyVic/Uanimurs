import 'package:flutter/material.dart';

Widget customTextButton({
  required BuildContext context,
  bool isFilled = false,
  double? borderRadius,
  required String buttonName,
  required VoidCallback onTap,
}){
  return Container(
    height: 50,
    width: double.maxFinite,
    decoration: BoxDecoration(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      color: isFilled?Theme.of(context).colorScheme.primary:Colors.transparent,
    ),
    child: MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      padding: EdgeInsets.all(0),
      elevation: 0,
      onPressed: onTap,
      color: isFilled?Theme.of(context).colorScheme.primary:Colors.transparent,
      child: Text(buttonName),
    ),
  );
}

class CustomIconTextButton extends StatelessWidget {
  final Icon icon;
  final String buttonName;
  final VoidCallback onTap;
  const CustomIconTextButton({
    super.key,
    required this.icon,
    required this.buttonName,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 10,),
          Text(buttonName,style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}

Widget buttonWithCenterIcon(IconData icon,VoidCallback onTap, {bool isActive = true}) => MaterialButton(
  padding: EdgeInsets.all(0),
  minWidth: 55,
  height: 55,
  elevation: 0,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
  ),
  onPressed: onTap,
  child: Icon(icon,color: isActive ? Colors.white : Colors.white.withOpacity(0.5),size: 40)
);



Widget customTabButton({
  required BuildContext context,
  required String buttonName,
  required VoidCallback onTap,
  bool isActive = false,
}){
  return TextButton(
    onPressed: onTap,
    style: TextButton.styleFrom(
      backgroundColor: isActive?Theme.of(context).colorScheme.primary:Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 10),
    ),
    child: Center(child: Text(buttonName,style:TextStyle(color: Theme.of(context).colorScheme.tertiary),)),
  );
}
