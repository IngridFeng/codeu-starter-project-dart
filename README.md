# codeu-starter-project-dart

#### Requirements:
* dart-sdk 2.5.2
> brew tap dart-lang/dart \
> brew install dart \
> pub global activate webdev \
> pub global activate stagehand \
[May need to set PATH for the last two tools]
* maven 3.0+
* JDK 7+

#### Instructions:
* Clone this repo and change **cd** into the root directory of **codeu-starter-project-dart**
* Run **brew info dart**, get the path of dart SDK, substitute the path in line 35 of pom.xml: **<dart.sdk>/usr/local/opt/dart/libexec</dart.sdk>**
* > mvn clean
* > mvn dart:dart2js
* > dart2js -o target/dart/user-page-loader.dart.js src/main/dart/user-page-loader.dart
* > dart2js -o target/dart/navigation-loader.dart.js src/main/dart/navigation-loader.dart
* > mvn appengine:devserver

#### TODO:
* Figure out how to use Flutter to generate mobile app at the same time
* Convert component in the HTML files into dart object
* Learn about AngularDart
* Hot reload
* Write python/bash script to automate the build process
* Fetch login status and display navbar & message form accordingly
* Fix error message while running devserver
