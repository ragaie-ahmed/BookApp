// // import 'package:bookapp/feature/presentation/viewmodel/Change/change_indicator_cubit.dart';
// // import 'package:bookapp/feature/presentation/viewmodel/Change/change_indicator_state.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // class MySliderApp extends StatefulWidget {
// //   @override
// //   _MySliderAppState createState() => _MySliderAppState();
// // }
// //
// // class _MySliderAppState extends State<MySliderApp> {
// //   double sliderValue = 0.0;
// //
// //   void incrementSlider() {
// //     setState(() {
// //       // Increase the slider value by a certain amount
// //       sliderValue += 0.1;
// //       // Ensure the value is within the valid range of the slider (0 to 1)
// //       sliderValue = sliderValue.clamp(0.0, 1.0);
// //     });
// //   }
// //
// //   void decrementSlider() {
// //     setState(() {
// //       // Decrease the slider value by a certain amount
// //       sliderValue -= 0.1;
// //       // Ensure the value is within the valid range of the slider (0 to 1)
// //       sliderValue = sliderValue.clamp(0.0, 1.0);
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Slider and Button Example'),
// //       ),
// //       body: Center(
// //         // child: Column(
// //         //   mainAxisAlignment: MainAxisAlignment.center,
// //         //   children: <Widget>[
// //         //     Text('Slider Value: $sliderValue'),
// //         //     Slider(
// //         //       value: sliderValue,
// //         //       onChanged: (value) {
// //         //         setState(() {
// //         //           sliderValue = value;
// //         //         });
// //         //       },
// //         //     ),
// //         //     Row(
// //         //       mainAxisAlignment: MainAxisAlignment.center,
// //         //       children: [
// //         //         ElevatedButton(
// //         //           onPressed: incrementSlider,
// //         //           child: Text('Increment'),
// //         //         ),
// //         //         SizedBox(width: 16),
// //         //         ElevatedButton(
// //         //           onPressed: decrementSlider,
// //         //           child: Text('Decrement'),
// //         //         ),
// //         //       ],
// //         //     ),
// //         //   ],
// //         // ),
// //       ),
// //     );
// //   }
// // }
// //
// // class Slider extends StatelessWidget {
// //   const Slider({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: BlocProvider(
// //         create: (context) => ChangeIndicatorCubit(),
// //         child: BlocConsumer<ChangeIndicatorCubit, ChangeIndicatorState>(
// //           listener: (context, state) {
// //             // TODO: implement listener
// //           },
// //           builder: (context, state) {
// //             var cubit=ChangeIndicatorCubit.get(context);
// //             return Column(
// //               children: [
// //
// // Slider(value: cubit.sliderValue, onChanged:(value){})              ],
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:bookapp/feature/presentation/view/Widget/Screen1.dart';
// import 'package:bookapp/feature/presentation/view/Widget/Screen2.dart';
// import 'package:bookapp/feature/presentation/viewmodel/Change/change_indicator_cubit.dart';
// import 'package:bookapp/feature/presentation/viewmodel/Change/change_indicator_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ChangeIn extends StatelessWidget {
//   const ChangeIn({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Ind"),
//       ),
//       body: BlocProvider(
//         create: (context) => ChangeIndicatorCubit(),
//         child: BlocConsumer<ChangeIndicatorCubit, ChangeIndicatorState>(
//           listener: (context, state) {
//             // TODO: implement listener
//           },
//           builder: (context, state) {
//             var cubit=ChangeIndicatorCubit.get(context);
//             return ListView(
//               children: [
//                 SliderTheme(
//                   data: SliderTheme.of(context).copyWith(
//             thumbShape: SliderComponentShape.noThumb
//             ),
//                   child: Slider(
//
//                     focusNode: FocusNode(),
//                     min: 0,
//                     max: 10,
//                     value: cubit.sliderValue, onChanged: (value) {
//                   cubit.sliderValue=value;
//                   },),
//
//                 ),
//                 PageView(
//                   physics: BouncingScrollPhysics(),
//
//                   children: [
//
//                     Screenone(),
//                     ScreenTwo()
//                   ],
//                 ),
//                 MaterialButton(
//                   color: Colors.teal,
//                   onPressed: () {
//                   cubit.changed();
//                 },child: Text("increment"),)
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';


class MySliderScreenApp extends StatefulWidget {
  @override
  _MySliderScreenAppState createState() => _MySliderScreenAppState();
}

class _MySliderScreenAppState extends State<MySliderScreenApp> {
  double _currentPage = 0.0;
  int _totalScreens = 3; // Adjust the total number of screens

  // Method to navigate to a specific screen
  void goToScreen(int screenIndex) {
    setState(() {
      _currentPage = screenIndex.toDouble();
    });
  }

  // Method to navigate to the next screen
  void nextScreen() {
    if (_currentPage < _totalScreens - 1) {
      setState(() {
        _currentPage += 1.0;
      });
    }
  }

  // Method to navigate to the previous screen
  void previousScreen() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage -= 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider and Screen Navigation Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen: ${_currentPage.toInt() + 1}'),
          Slider(
            value: _currentPage,
            min: 0.0,
            max: _totalScreens - 1.0,
            onChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _totalScreens,
                  (index) => ElevatedButton(
                onPressed: () => goToScreen(index),
                child: Text('Screen ${index + 1}'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: previousScreen,
                child: Text('Previous Screen'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: nextScreen,
                child: Text('Next Screen'),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: List.generate(
                _totalScreens,
                    (index) {
                  return Visibility(
                    visible: _currentPage.toInt() == index,
                    child: buildScreen('Screen ${index + 1}', Colors.blue),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildScreen(String text, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Text(text),
      ),
    );
  }
}