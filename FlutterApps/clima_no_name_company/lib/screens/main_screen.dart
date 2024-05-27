import 'package:clima_no_name_company/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima_no_name_company/services/networking.dart';
import 'package:clima_no_name_company/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String CN = "_mainScreenState";

  @override
  void initState() {
    getLocationData();
  }
  void getLocationData() async {
    String MN = "getLocationData";
    try {
      var networkData = await NetworkHelper().getData();
      print("$CN.$MN: $networkData");

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(networkData: networkData,);
      }));
    } catch (e) {
      print("!!!$CN.$MN: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: kCloudyWeatherDarKColor,
          size: 100.0,
        ),
      ),
    );
  }
}
