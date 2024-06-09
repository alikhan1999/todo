import 'package:flutter/material.dart';
import 'package:todo/constant/style.dart';
import 'package:todo/ui/base/base_widget.dart';

class StyledSwitch extends BaseStateFullWidget {
  final void Function(bool isToggled) onToggled;
  final bool value;
  StyledSwitch({Key? key, required this.onToggled, required this.value}) : super(key: key);

  @override
  State<StyledSwitch> createState() => _StyledSwitchState();
}

class _StyledSwitchState extends State<StyledSwitch> {
  bool isToggled = false;
  double size = 30;
  double innerPadding = 0;

  @override
  void initState() {
    isToggled = widget.value;
    innerPadding = size / 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      onPanEnd: (b) {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      child: AnimatedContainer(
        height: widget.dimens.k25,
        width: widget.dimens.k45,
        padding: EdgeInsets.all(widget.dimens.k3),
        alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isToggled ? Style.scaffoldBackground : Style.scaffoldBackground,
        ),
        child: Container(
          width: widget.dimens.k20,
          height: widget.dimens.k20,
          decoration: Style.splashBackgroundLinearDecoration(opacity: isToggled ? 1.0 : 0.5).copyWith(
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
