import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewRoute.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

mixin Test {
  void mixinTest() {
//		Future.delayed(Duration(seconds: 1),() {
//			throw "nihasdfaf';";
//			return "return value future";
//		})
//		.then((value) {
//			print("then value = $value");
//		}, onError: (e ) {
//			print("onError $e");
//		})
//
//		.whenComplete(() {
//			print("onComplete");
//			_launchUrl();
//		})
//		.catchError((e) {
//			print( " catch error $e");
//		});

//		Future.wait([
//			Future.delayed(Duration(seconds: 1), () {
//
//				return "11111";
//
//			}),
//			Future.delayed(Duration(seconds: 1), () {
//
//				return "222 ";
//
//			})
//		]).then((value) {
//			print("value = $value");
//
//
//		}).catchError((e) {
//
//			print("e  = $e");
//
//		});
//
//		Stream.fromFutures([
//			// 1秒后返回结果
//			Future.delayed(new Duration(seconds: 1), () {
//				return "hello 1";
//			}),
//			// 抛出一个异常
//			Future.delayed(new Duration(seconds: 2), () {
//				throw AssertionError("Error");
//			}),
//			// 3秒后返回结果
//			Future.delayed(new Duration(seconds: 3), () {
//				return "hello 3";
//			})
//		]).listen((data) {
//			print(data);
//		}, onError: (e) {
//			print(e.message);
//		}, onDone: () {
//
//		});
  }
}

class WordApp extends StatelessWidget with Test {
  @override
  Widget build(BuildContext context) {
    mixinTest();
    return MaterialApp(title: "Flutter zenglw", home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "我是标题",
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: Center(child: _buildSuggestions()),
    );
  }

  _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, index) {
      if (_suggestions.isEmpty) {
        _suggestions.addAll(generateWordPairs().take(10));
      }

      if (index == _suggestions.length - 1) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair suggestion) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(suggestion.asPascalCase),
            Icon(
              Icons.favorite,
              color: Colors.red,
            )
          ],
        ),
        Divider(height: 120, color: Colors.grey, thickness: 10)
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          var pageName = settings.name;
          print("pageName = $pageName");

          switch (pageName) {
            case "new_route":
              return NewRoute(
                text: "我是newroute onGenerate",
              );
//                  args: <String ,Object>{"name" :"zenglw", "age": 26},);
              break;
            default:
              return MyHomePage(title: "我是首页onGenerate");
          }
        });
      },
      initialRoute: "/",
//      routes: {
//        "new_route": (context) => NewRoute(text: "我是新的路由11111"),
//        "/": (context) => MyHomePage(
//              title: "我是首页",
//            )
//      },
//      home: MyHomePage(
//        title: "我是首页home",
//      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  _MyHomePageState() {
    print("nih");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'asdfjaksdf1111111111111111111111111111111111111111111111111jk',
            ),
            MaterialButton(
              child: Text("我是按钮"),
              onPressed: () async {
                print("button press");

//								_launchUrl();
                var returnValue =
                    await /*Navigator.push(context,
									MaterialPageRoute(
										builder: (context) {
											return NewRoute(text: "我是参数",);
										},
										maintainState: true,
										fullscreenDialog: false
									));*/
                    Navigator.pushNamed(context, "new_route",
                        arguments: {"name": "zenglw", "age": 26});

                print("返回的参数为: ${returnValue}");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

_launchUrl() async {
  const url = "http://www.baidu.com";

  if (await canLaunch(url)) {
    final result = await launch("http://www.baidu.com");

    print("result = $result");
  } else {
    print("can't launch url");
  }
}
