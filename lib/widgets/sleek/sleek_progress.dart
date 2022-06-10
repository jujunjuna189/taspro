import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:taspro/utils/colors.dart';

class SleekProgress extends StatefulWidget {
  const SleekProgress({Key? key}) : super(key: key);

  @override
  State<SleekProgress> createState() => _SleekProgressState();
}

class _SleekProgressState extends State<SleekProgress> {
  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        customColors: CustomSliderColors(
          trackColor: backgroundLightPrimaryColor,
          progressBarColors: [backgroundPrimaryColor, backgroundPrimaryColor],
          shadowMaxOpacity: 0,
        ),
        infoProperties: InfoProperties(topLabelText: "Progress...", topLabelStyle: const TextStyle(color: textPrimaryColor)),
        customWidths: CustomSliderWidths(progressBarWidth: 15, trackWidth: 15),
        startAngle: 50,
      ),
      initialValue: 50,
      onChange: ((double value){
        print(value);
      }),
    );
  }
}
