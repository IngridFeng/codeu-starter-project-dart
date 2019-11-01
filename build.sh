#!/bin/bash

# get path of dart SDK
echo "------------Setting path of dart SDK in pom.xml-------------"
brew info dart >> log.txt
tag=$(tail -n 1 log.txt)
tag_no_space="$(echo -e "${tag}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
echo "dart SDK path: $tag_no_space"

# set path of dart SDK in pom.xml
old_line=$(sed -n '/dart.sdk>$/ p' pom.xml)
old_line=$(echo "${old_line}" | sed -e 's/[]$.*[\^]/\\&/g' )

new_line="    <dart.sdk>${tag_no_space}</dart.sdk>"
new_line=$(echo "${new_line}" | sed -e 's/[]$.*[\^]/\\&/g' )

sed -i -e "s|${old_line}|${new_line}|g" pom.xml
echo "-----------------Path replacement sucessful-----------------"

echo "---------------Cleaning up previous builds------------------"
mvn clean

echo "---------Initializing Dark SDK plugin for Maven-------------"
mvn dart:dart2js

echo "-----------Converting Dart files to JavaScript--------------"
dart2js -o target/dart/user-page-loader.dart.js src/main/dart/user-page-loader.dart
dart2js -o target/dart/navigation-loader.dart.js src/main/dart/navigation-loader.dart

echo "-------------------Build and Run the app--------------------"
mvn appengine:devserver

# Clean up
echo "-------------------------Cleaning up------------------------"
rm pom.xml-e
rm log.txt
