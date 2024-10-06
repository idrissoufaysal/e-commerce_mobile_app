import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/authScreen/login_page.dart';
import 'package:myapp/screens/authScreen/register_page.dart';
import 'providers/cart_provider.dart';
import 'providers/favorite_provider.dart';
import 'screens/na_bar_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          // for add to cart
          ChangeNotifierProvider(create: (_) => CartProvider()),
          // for favorite
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          //for user
          ChangeNotifierProvider(create: (_) => UserModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.mulishTextTheme(),
          ),
          home: const LoginScreen(),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/signUp': (context) => const SignUpScreen(),
            '/bottomNavBar': (context) => const BottomNavBar()
          },
        ),
      );
}
