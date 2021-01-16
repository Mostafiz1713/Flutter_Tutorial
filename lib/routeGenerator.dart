import 'package:Flutter_Tutorial/Screens/Intermediate.dart';
import 'package:Flutter_Tutorial/Screens/beginner.dart';
import 'package:Flutter_Tutorial/Screens/homePage.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
	static Route<dynamic> generateRoute(RouteSettings settings) {
		// Getting arguments passed in while calling Navigator.pushNamed
		final args = settings.arguments;

		switch (settings.name) {
			case '/':
				return MaterialPageRoute(builder: (_) => HomePage());
			case '/beginner':
				return MaterialPageRoute(builder: (_) => Beginner());
			case '/intermediate':
				return MaterialPageRoute(builder: (_) => Intermediate());
				// If args is not of the correct type, return an error page.
				// You can also throw an exception while in development.
				return _errorRoute();
			default:
			// If there is no such named route in the switch statement, e.g. /third
				return _errorRoute();
		}
	}

	static Route<dynamic> _errorRoute() {
		return MaterialPageRoute(builder: (_) {
			return Scaffold(
				appBar: AppBar(
					title: Text('Error'),
				),
				body: Center(
					child: Text('ERROR'),
				),
			);
		});
	}
}