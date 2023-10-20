import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class CircularProgressIndicatorCustom extends StatefulWidget {
  const CircularProgressIndicatorCustom({super.key});

  @override
  State<CircularProgressIndicatorCustom> createState() => _CircularProgressIndicatorCustomState();
}

class _CircularProgressIndicatorCustomState extends State<CircularProgressIndicatorCustom> {
  @override

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
      loadingPercentage = (i + 2) / totalTasks;
      setState(() {}); // Trigger a rebuild to update the UI
    }

    // Data loading is complete
  }

  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 85,
            height: 85,
            child: Image.asset("assets/images/logoSimples.png",fit: BoxFit.fill),
          ),
          Container(
            width: 80,
            height:80,
            alignment: Alignment.center,
            child: LiquidCircularProgressIndicator(
              value: loadingPercentage, // Defaults to 0.5.
              valueColor:   AlwaysStoppedAnimation(Theme.of(context).colorScheme.primary.withOpacity(0.5)), // Defaults to
              // the
              // current
              // Theme's
              // accentColor.
              backgroundColor: Colors.transparent, // Defaults to the current Theme's backgroundColor.
              borderColor: Colors.transparent,
              borderWidth: 0.0,
              direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis
              // .horizontal = left to right). Defaults to Axis.vertical.
              center: const Text(""),
            ),
          ),
        ],
      ),
    );
  }
}
