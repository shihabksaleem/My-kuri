import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mykuri/core/constant/animation_constants.dart';

class ReusableLoadingWidget extends StatelessWidget {
  final double height;
  const ReusableLoadingWidget({
    super.key,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Lottie.asset(
          AnimationConstants.loadingAnimation,
        ),
      ),
    );
  }
}
