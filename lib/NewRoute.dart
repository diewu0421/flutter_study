import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {

	NewRoute({
		Key key,
		@required this.text,
		this.args
	}) : super(key: key);

	final String text;
	Map<String, Object> args;


	@override
	Widget build(BuildContext context) {
		// TODO: implement build
		args ??= Map();
		print("args: ${args['age2']}");


		return new Scaffold(
			appBar: AppBar(
				title: Text("$text"),
			),
			body: Center(
				child: MaterialButton(
					child: Text("我是一个按钮"), onPressed: () {
//					Timer.periodic(Duration(seconds: 1), (timer) {
//						if (timer.tick == 5) {
//							timer.cancel();
//						}
//						print("timer = ${timer.tick}");
//					});

					Navigator.of(context).pop("我是返回值啊");
				},

				),
			),
		);
	}

}