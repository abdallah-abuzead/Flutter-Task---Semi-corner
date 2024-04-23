import 'package:flutter/material.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: const Color(0xFFEE4400),
            child: const Center(
              child: Text('OFFLINE'),
            ),
          ),
          Icon(
            Icons.wifi_off,
            size: screenWidth * 0.5,
            color: Colors.grey,
          ),
          Text(
            "No internet connection",
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Try these steps to get back online :",
            style: TextStyle(
              fontSize: screenWidth * 0.050,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: screenWidth * 0.05,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 14),
              SizedBox(width: 5,),
              Text("Check your modem and router"),
            ],
          ),
          SizedBox(
            height: screenWidth * 0.03,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 14),
              SizedBox(width: 5,),
              Text("Reconnect to Wi-Fi"),
            ],
          ),
          SizedBox(
            height: screenWidth * 0.05,
          ),
          ElevatedButton(
            onPressed: () {
              buildShowSnackBar(context);
            },
            child: const Text("Reconnect"),
          ),
        ],
      ),
    );
  }

  void buildShowSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: "Close",
          onPressed: () {
            ScaffoldMessenger.of(context)
                .hideCurrentSnackBar();
          },
        ),
        content: const Row(
          children: [
            Icon(
              Icons.wifi_off,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text("You are currently offline."),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget Check(){
    return         Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              WidgetSpan(
                child: Icon(Icons.check_circle, size: 14),
              ),
              WidgetSpan(
                child: SizedBox(
                  width: 5,
                ),),
              TextSpan(
                text: "Check your modem and router",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: const TextSpan(
            children: [
              WidgetSpan(
                child: Icon(Icons.check_circle, size: 14),
              ),
              WidgetSpan(
                child: SizedBox(
                  width: 5,
                ),),
              TextSpan(
                text: "Reconnect to Wi-Fi",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }
}
