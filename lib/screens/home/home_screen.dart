import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mariadda_app/screens/home/profile_screen.dart';

import '../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../instagram_ui/InstaHomeView.dart';

class HomeScreen extends StatefulWidget {
	String email1= "";

	 HomeScreen(String? email, {
		 super.key
	 }) {
		 this.email1=email!;

	 }


	@override
	_MyHomePageState createState() => _MyHomePageState(email1);
}

class _MyHomePageState extends State<HomeScreen> {
	int _currentIndex = 0;
	String email ;


  _MyHomePageState(this.email);



	@override
	Widget build(BuildContext context) {

		final screens = [
			const InstaHomeView(),
			 ProfileScreen(email),
		];
		return Scaffold(
			appBar: AppBar(
				title: const Text(
 					'Welcome, you are In !'
 				),
 				actions: [
 					IconButton(
 						onPressed: () {
 							context.read<SignInBloc>().add(const SignOutRequired());
 						},
 						icon: Icon(Icons.login)
 					) 				],
 			),
			body: IndexedStack(
				index: _currentIndex,
				children: screens,
			),

			bottomNavigationBar: BottomNavyBar(
				showInactiveTitle: false,
				selectedIndex: _currentIndex,
				showElevation: true,
				itemCornerRadius: 24,
				iconSize: 20,
				curve: Curves.easeIn,
				onItemSelected: (index) => setState(() => _currentIndex = index),
				items: <BottomNavyBarItem>[
					BottomNavyBarItem(
						icon: const Icon(Icons.apps),
						title:const  Text(' Home'),
						activeColor: Colors.red,
						textAlign: TextAlign.center,
					),
					BottomNavyBarItem(
						icon: const Icon(Icons.people),
						title:const Text(' Profile'),
						activeColor: Colors.purpleAccent,
						textAlign: TextAlign.center,
					),
					BottomNavyBarItem(
						icon: const Icon(Icons.message),
						title:const  Text(
							' Messages Received',
						),
						activeColor: Colors.pink,
						textAlign: TextAlign.center,
					),
					BottomNavyBarItem(
						icon:const  Icon(Icons.settings),
						title:const  Text(' Settings'),
						activeColor: Colors.blue,
						textAlign: TextAlign.center,
					),
				],
			),

		);
	}
}

