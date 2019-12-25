void main() {
	print(11111111);
}

bool topLevel = true;

class User {

	var a = 'a';
	var b = 'b';

	User() {
		print("no-args constructor");
	}

	User.origin() {
		a = 'c';
		b = 'd';
	}

	User.origin2() {
		print("origin2");
	}

	test() {
	}

	test2() {
		print("1111");
		return this;
	}
}



class UserSon extends User {
	UserSon.origin2() : super.origin2();

	var name;

	UserSon(name) {
		print("son name = ${name}");

		this.name = name;
	}

}

class MyTest {

	getTest() => print(111);

	var text = "Confirm";

	test() async {
//		var son = UserSon("zenglw");
//		print(son.name);
		getElement(500);
		print("2222222");

	}

	getElement(index) async {

		final ge = naturalsTo(1000);
		final value= await ge.elementAt(index);
		print("value = $value");

	}

	Stream<int> naturalsTo(int n) async* {
		int k = 0;
		while (k < n) yield k++;
	}
	Function makeAdder(addBy) {
		return (i) => addBy + i;
	}

	void doStuff({List<int> list = const [1, 2, 3],
		Map<String, String> gifts = const {
			'first': 'paper',
			'second': 'cotton',
			'third': 'leather'
		}}) {
		print('list:  $list');
		print('gifts: $gifts');
	}

	void positionOptional(String from, String msg,
		[String device = "我是devices", mood = "我是modd"]) {
		print("from $from msg = $msg device =$device  mod = $mood");
	}

	void enableFlags({bold = true, hidden = "22222222"}) {
		print("bold = $bold  hidden = $hidden");
	}

	isNoble(int atomicNumber) => print("atomicNumber is $atomicNumber");

	func(arg) {
		print("arg = $this");
	}
}


isNumber(num) {
	print("num is$num");
}

int test1(int a, int b) {
	return a + b;
}

void add(int a, int b) {
	print(a + b);
}