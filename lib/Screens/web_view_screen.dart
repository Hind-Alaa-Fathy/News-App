import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
   WebViewScreen({super.key,required this.url,required this.category});
  String url;
  String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text(category,style: TextStyle(color: Colors.blueGrey[700])),
      ),
      body:WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
