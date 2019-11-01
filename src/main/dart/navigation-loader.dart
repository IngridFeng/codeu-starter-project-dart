/*
 * Copyright 2019 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Adds a login or logout link to the page, depending on whether the user is
 * already logged in.
 */
import 'dart:html';


void addLoginOrLogoutLinkToNavigation() {
  var navigationElement = querySelector('#navigation');
  if (navigationElement == null) {
    window.console.warn('Navigation element not found!');
    return;
  }
  navigationElement.children.add(createListItem(createLink(
      '/user-page.html?user=' + 'tmp user name', 'Your Page')));


  // fetch('/login-status')
  //     .then((response) => {
  //       return response.json();
  //     })
  //     .then((loginStatus) => {
  //       if (loginStatus.isLoggedIn) {
  //         navigationElement.appendChild(createListItem(createLink(
  //             '/user-page.html?user=' + loginStatus.username, 'Your Page')));
  //
  //         navigationElement.appendChild(
  //             createListItem(createLink('/logout', 'Logout')));
  //       } else {
  //         navigationElement.appendChild(
  //             createListItem(createLink('/login', 'Login')));
  //       }
  //     });
}

/**
 * Creates an li element.
 * @param {Element} childElement
 * @return {Element} li element
 */
LIElement createListItem(Element childElement) {
  final listItemElement = new Element.li();
  listItemElement.children.add(childElement);
  return listItemElement;
}

/**
 * Creates an anchor element.
 * @param {string} url
 * @param {string} text
 * @return {Element} Anchor element
 */
Element createLink(String url, String text) {
  var linkElement = new AnchorElement()
    ..href = url
    ..text = text;
  return linkElement;
}

void main() {
  addLoginOrLogoutLinkToNavigation();
}
