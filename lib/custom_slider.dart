import 'package:custom_slider/sme_slider_value_indicator_shape2.dart';
import 'package:flutter/material.dart';
import 'sme_slider_thumb_shape.dart';
import 'sme_slider_track_shape.dart';
//import 'sme_slider_value_indicator_shape.dart';
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

  final List<int> _ratingPoints = [ 0 , 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  double _selectedValue = 5;

  LinearGradient gradient = const LinearGradient(
      colors: <Color> [
        Color(0xff7FCCE6),
        Color(0xff13B3E6),
        Color(0xff0385BF),
      ]
  );
  
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: SmeSliderThumbShape(
          thumbRadius: 10.0,
          sliderValue: _selectedValue,
        ),
        trackShape: SmeSliderTrackShape(gradient: gradient, darkenInactive: true),
        //valueIndicatorShape: SmeSliderValueIndicatorShape(sliderValue: _value),
        valueIndicatorShape: const SmeSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.always,
        //thumbShape: RoundSliderThumbShape(elevation: 10),
        //overlayShape: RoundSliderOverlayShape(overlayRadius: 2),
        //overlayColor: Colors.red,
        inactiveTrackColor: Colors.grey.shade200,
        activeTrackColor: kCoolPurple,
        //valueIndicatorColor: Color(0xff0385BF), //kCoolPurple,
        thumbColor: Colors.white, //Color(0xff0385BF), //kCoolPurple,
        inactiveTickMarkColor: Colors.grey.shade200, //Color(0xff13B3E6),
        activeTickMarkColor: Color(0xff13B3E6), //Colors.grey.shade400,
      ),
      /*child: Slider(
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
      ), */
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                SizedBox(
                  width: 55,
                  child: Text("Not At All Likely",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff065198),
                      )),
                ),
                Spacer(),
                SizedBox(
                  width: 60,
                  child: Text(
                    "Extremely Likely",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff065198),
                    ),

                  ),
                )
              ],
            ),
          ),
          Stack(
            children:[
              Slider(
                key: _sliderKey,
                value: _selectedValue,
                min: 0,
                max: 10,
                divisions: 10,
                label: '${_selectedValue.toInt()}',
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 23, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,children: widgets,),
              ),*/

              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 23, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _ratingPoints.map((item) {
                    return _buildRatingPointBar(context, item);
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildRatingPointBar(BuildContext context, int currentPoint) {
    Color dotsColor = Colors.grey;
    if(currentPoint <= _selectedValue) {
      dotsColor = const Color(0xff0385BF);
    }
    return Column(
      children: [
        Text(".",style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: dotsColor,
        ),
        ),
        const SizedBox(height: 5,),
        Text(currentPoint.toString(),
          style:  TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            foreground: Paint()..shader = gradient.createShader(
              const Rect.fromLTWH(100.0, 200.0, 200.0, 70.0),
            ),
          ),
        ),
      ],
    );
  }
}
