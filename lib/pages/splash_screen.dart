import 'package:flutter/material.dart';import 'package:flutter_svg/svg.dart';class SplashScreen extends StatefulWidget {  const SplashScreen({super.key});  @override  State<SplashScreen> createState() =>      _SplashScreenState();}class _SplashScreenState    extends State<SplashScreen> {  @override  Widget build(BuildContext context) {    return Scaffold(        body: Center(            child: Image.asset(                'assets/images/splash_logo_150.png')));  }}