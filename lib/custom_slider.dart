import 'package:flutter/material.dart';
import 'sme_slider_thumb_shape.dart';
import 'sme_slider_track_shape.dart';
import 'sme_slider_value_indicator_shape.dart';
import 'constants.dart';

//https://levelup.gitconnected.com/custom-spinner-tooltip-flutter-e3576d531488
//https://stackoverflow.com/questions/72831818/how-to-customize-a-valueindicatortextstyle-depending-of-a-condition-flutter-sli
class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with TickerProviderStateMixin {
  final GlobalKey _sliderKey = GlobalKey();

  double _value = 50;

  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = const LinearGradient(
        colors: <Color> [
          Color(0xff7FCCE6),
          Color(0xff13B3E6),
          Color(0xff0385BF),
        ]
    );
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: SmeSliderThumbShape(
          thumbRadius: 10.0,
          sliderValue: _value,
        ),
        trackShape: SmeSliderTrackShape(gradient: gradient, darkenInactive: true),
        valueIndicatorShape: SmeSliderValueIndicatorShape(sliderValue: _value),
        showValueIndicator: ShowValueIndicator.always,
        //thumbShape: RoundSliderThumbShape(elevation: 10),
        //overlayShape: RoundSliderOverlayShape(overlayRadius: 2),
        //overlayColor: Colors.red,
        inactiveTrackColor: Colors.grey.shade200,
        activeTrackColor: kCoolPurple,
        valueIndicatorColor: Color(0xff0385BF), //kCoolPurple,
        thumbColor: Colors.white, //Color(0xff0385BF), //kCoolPurple,
        inactiveTickMarkColor: Color(0xff13B3E6), //Colors.grey.shade200,
        activeTickMarkColor: Colors.grey.shade400, //Color(0xff13B3E6),
      ),
      child: Slider(
        key: _sliderKey,
        value: _value,
        min: 0,
        max: 100,
        divisions: 10,
        label: '${_value.toInt()}',
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
        },
      ),
    );
  }
}
