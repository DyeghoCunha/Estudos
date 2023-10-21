import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class CircularProgressIndicatorCustom extends StatefulWidget {
  const CircularProgressIndicatorCustom({Key? key}) : super(key: key);

  @override
  _CircularProgressIndicatorCustomState createState() =>
      _CircularProgressIndicatorCustomState();
}

class _CircularProgressIndicatorCustomState
    extends State<CircularProgressIndicatorCustom> {
  double loadingPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    _loading();
  }

  Future<void> _loading() async {
    int totalTasks = 100;
    for (int i = 0; i < totalTasks; i++) {
      // Simulate loading by sleeping for a short time
      await Future.delayed(const Duration(milliseconds: 10));
      loadingPercentage = (i + 1) / totalTasks;
      setState(() {});
    }

    // Data loading is complete
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 105,
            height: 105,
            child: Image.asset("assets/images/logoSimples.png", fit: BoxFit.cover),
          ),
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            child: LiquidCircularProgressIndicator(
              value: loadingPercentage, // Defaults to 0.5.
              valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).colorScheme.primary.withOpacity(0.5)),
              backgroundColor: Colors.transparent,
              borderColor: Colors.transparent,
              borderWidth: 0.0,
              direction: Axis.vertical,
              center: const Text(""),
            ),
          ),
        ],
      ),
    );
  }
}
