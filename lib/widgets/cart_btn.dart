import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key, this.darkStatus}) : super(key: key);

  // final CartService cartService;
  final bool? darkStatus;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      onPressed: () {},
      icon: badges.Badge(
        elevation: 0,
        showBadge: true,
        badgeColor: Colors.yellow,
        shape: BadgeShape.circle,
        // padding: const EdgeInsets.all(6),
        borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
        animationType: BadgeAnimationType.scale,
        animationDuration: const Duration(milliseconds: 200),
        position: BadgePosition.topEnd(end: -5, top: -5),
        badgeContent: Text('${1}', style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.w500)),
        child: Icon(CupertinoIcons.shopping_cart, size: 26, color: darkStatus == true ? Colors.grey[600] : Colors.white),
      ),
    );
  }
}
