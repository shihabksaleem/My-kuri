import 'package:flutter/material.dart';
import 'package:mykuri/presentation/home_screen/view/home_screen.dart';
import 'package:mykuri/presentation/profile_screen/view/profile.dart';
import 'package:mykuri/presentation/wallet_screen/view/wallet_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 1;
  final screens = [WalletScreen(), HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SizedBox(child: Image.asset("assets/images/wallet.png")),
              label: "Wallet"),
          BottomNavigationBarItem(
              icon: SizedBox(child: Image.asset("assets/images/Group 21.png")),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SizedBox(child: Image.asset("assets/images/Vector.png")),
              label: "Profile"),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
