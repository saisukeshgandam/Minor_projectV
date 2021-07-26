import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Travel Guide'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Razorpay _razorpay;
  //_razorpay = Razorpay();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    //_razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    //_razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    //_razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout()  {
    var options = {
      'key': 'rzp_test_DvcEoCuc6uIh6H',
      'amount': 28200,
      'name': 'Shaiq',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('e');
    }
  }

  get nameController => null;

  get passwordController => null;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Guide'),
      ),
      body: Padding(padding: EdgeInsets.all(9),
      child: ListView(
        children: <Widget> [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(9),
            child: Text('Welcome to Travel Guide',style: TextStyle(color: Colors.black,fontSize:25.0),),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(9),
            child: Text('Please Login Here',style: TextStyle(fontSize: 19),),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(9),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.black,
                  child: Text('Forgot Password'),
                ),
                Padding(
              padding: const EdgeInsets.all(45.0),
              child: ElevatedButton(onPressed:(){
                
                openCheckout();

              }, child: Text("Login")),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Does not have an account?'),
                  TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ThirdScreen();

                  }));  
                  },
                   child: Text(
                     'Sign up',style:TextStyle(fontSize: 18),
                   ))
                ],
              ),
            )

        ],
      )
      )
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
      //) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
// SecondScreen after login



// Third page for signup

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({ Key? key }) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  get nameController => null;

  get passwordController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text('Travel Guide'),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget> [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'SIGN UP ',style: TextStyle(color: Colors.black,fontSize:25.0),
            ),
          ),
          Container(
            padding: EdgeInsets.all(9),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Email'),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Password'),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Confirm Password'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(45.0),
              child: ElevatedButton(onPressed:(){
                
                
                }, child: Text("Sign In")),
            ),
        ],
      ),
      ),
      
    );
  }
}