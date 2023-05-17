
import 'package:flutter/cupertino.dart';
import 'package:jumping_dot/jumping_dot.dart';

class UserMessage extends StatelessWidget {
  final String text;
  final Color color;
  final Icon icon;
  final bool isUser;
  const UserMessage({
    Key? key,
    required this.text, required this.color, required this.icon, required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:isUser? 18:0,right:isUser? 0:18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.only(topLeft: const Radius.circular(5),topRight: const Radius.circular(5),bottomLeft: isUser? const Radius.circular(5): const Radius.circular(0),bottomRight:isUser? const Radius.circular(0): const Radius.circular(5)),
          color: color,

        ),
        padding: const EdgeInsets.all(8),
        child: text=="loading"? Container(
          width: 100,
          height: 20,
          child: JumpingDots(
            color: CupertinoColors.white,
            radius: 5,
            numberOfDots: 3,

          ),
        ) : Text(text,
          style: const TextStyle(
            color: Color(0xffd1d5db),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),),
      ),
    );
  }
}