import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class LightRollingSwitch extends StatefulWidget {
  final String onS;
  final String offS;
  LightRollingSwitch({super.key, required this.onS, required this.offS});

  @override
  State<LightRollingSwitch> createState() => _LightRollingSwitchState();
}

class _LightRollingSwitchState extends State<LightRollingSwitch> {
  @override
  Widget build(BuildContext context) {
    return LiteRollingSwitch(
        width: MediaQuery.of(context).size.width * 0.1,
        value: widget.onS!.compareTo("Line Modifier") == 0 ? false : true,
        textOn: widget.onS!,
        textOff: widget.offS!,
        textSize: MediaQuery.of(context).size.height * 0.015,
        colorOn: Colors.greenAccent,
        colorOff: Colors.redAccent,
        iconOn: Icons.done,
        iconOff: Icons.disabled_by_default,
        onTap: () {},
        onDoubleTap: () {},
        onSwipe: () {},
        onChanged: (value) {});
  }
}
