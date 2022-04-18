import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:river/constants/constant.dart';
import 'package:river/gen/assets.gen.dart';

const Color cWhite = Color(0xFFFAFEFE);
const Color cDark = Color(0xff2B2B2C);

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        backgroundColor: cWhite,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Assets.images.getStartIntro.path),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        const SizedBox(
                            height: 80,
                            child: AutoSizeText(
                              'Pay, Manage,\nGrow...',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: cDark),
                              minFontSize: 24,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 35,
                          child: AutoSizeText(
                            'A social Media For your Brand, manage All of your payment related needs',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700]!),
                            minFontSize: 12,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                         GradientButton(
                          onTap: (){},
                          gradient:KGradiant.blue ,padding: const EdgeInsets.symmetric(vertical: 25),
                          child: const Text('Get Started' ,textAlign: TextAlign.center, style: TextStyle(color: cWhite , fontSize: 16),),
                        ),const SizedBox(height: 20,),
                        Wrap( runAlignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, alignment: WrapAlignment.center, children: [Text('Already have an account? ') , TextButton(onPressed: (){}, child: Text('Signin'))],)
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key? key,
      required this.child,
      required this.onTap,
      this.gradient,
      this.boxShadow,
      this.padding,
      this.color,
      this.borderRadius})
      : super(key: key);
  final Widget child;
  final void Function()? onTap;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  /// As Default The color is set to [transparent].
  /// set color if you don't want to use gradient.
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: boxShadow,
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(14.0),
      ),
      child: Material(
        color: color ?? Colors.transparent,

        // elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(14.0),
        ),
        child: InkWell(
          borderRadius: borderRadius ?? BorderRadius.circular(14.0),
          splashColor: Colors.black.withOpacity(.2),
          overlayColor: MaterialStateProperty.resolveWith(
              (states) => Colors.black.withOpacity(.2)),
          onTap: onTap,
          child: Container(
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: child),
        ),
      ),
    );
  }
}
