import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:singular_flutter_sdk/singular.dart';
import 'package:singular_flutter_sdk/singular_config.dart';
import 'package:singular_flutter_sdk/singular_link_params.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? deeplink;

  @override
  void initState() {
    String apiKey = dotenv.env['SINGULAR_API_KEY']!;
    String apiSecret = dotenv.env['SINGULAR_API_SECRET']!;
    print("API Key: $apiKey");
    print("API Secret: $apiSecret");
    SingularConfig config = SingularConfig(apiKey, apiSecret);
    config.waitForTrackingAuthorizationWithTimeoutInterval = 60;
    config.clipboardAttribution = true;
    config.singularLinksHandler = (SingularLinkParams params) {
      print("Deeplink: ${params.deeplink}");
      print("Passthrough: ${params.passthrough}");
      print("IsDeferred: ${params.isDeferred}");
      print("URL Parameters: ${params.urlParameters}");
      print("Passthrough: ${params.passthrough}");

      setState(() {
        deeplink = params.deeplink;
      });
    };
    Singular.start(config);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Deeplink: $deeplink"),
      ),
    );
  }
}
