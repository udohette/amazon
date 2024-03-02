import 'package:amazon/controller/provider/auth_provider/address_provider.dart';
import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/view/user/user_persistent_nav_bar/user_bottome_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_)=>AuthProvider()),
        ChangeNotifierProvider<AddressProvider>(create: (_)=>AddressProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserBottomNavBar(),

      ),
    );
  }
}
