import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:url_launcher/url_launcher.dart';

class MarkdownRender extends StatefulWidget {
  @override
  _MarkdownRenderState createState() => _MarkdownRenderState();
}

class _MarkdownRenderState extends State<MarkdownRender> {
  String textRender = '''
  #Contoh Markdown (H1)
  
  ##Contoh (H2)
  If the _conflicting_ dependency is __not__ itself a package, 
  but an Android-specific library like guava, 
  the dependency override declaration must be added to:
  - Gradle 
  - build 
  - logic 
  - instead.
  To force the use of guava version 28.0, 
  make the following changes to the app’s android/build.gradle file:

  content_copy:
  ```
  configurations.all {
      resolutionStrategy {
         force 'com.google.guava:guava:28.0-android'
     }
  }
  ```
  CocoaPods does not currently offer dependency override functionality.''';

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: Markdown(data: textRender));
  }
}
