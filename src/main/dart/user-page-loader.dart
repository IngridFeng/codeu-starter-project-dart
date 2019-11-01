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
import 'dart:html';
/** Sets the page title based on the URL parameter username. */
void setPageTitle(String parameterUsername) {
  querySelector('#page-title').text = 'test'; //parameterUsername
  document.title = parameterUsername + ' - User Page'; //TODO
}

/**
 * Shows the message form if the user is logged in and viewing their own page.
 */
void showMessageFormIfViewingSelf() {
  querySelector('message-form').classes.remove('hidden');
  //
  // fetch('/login-status')
  //     .then((response) => {
  //       return response.json();
  //     })
  //     .then((loginStatus) => {
  //       if (loginStatus.isLoggedIn && loginStatus.username == parameterUsername) {
  //         querySelector('message-form').classes.remove('hidden');
  //       }
  //     });
}

/** Fetches messages and add them to the page. */
void fetchMessages() {
  final messages = ['This', 'is', 'loaded', 'text.'];
  final messagesContainer = querySelector('message-container');
  String defaultText = '<p>This user has no posts yet.</p>';
  messagesContainer.text = messages.length == 0 ? defaultText : '';
  for (var message in messages) {
    var messageDiv = buildMessageDiv(message);
    messagesContainer.children.add(messageDiv);
  }
  // var url = '/messages?user=' + parameterUsername;
  // HttpRequest.getString(url)
  // .then((String response) {
  //   for (final ele in json.decode(response))
  // });
  //
  // fetch(url)
  //     .then((response) => {
  //       return response.json();
  //     })
  //     .then((messages) => {
      //   var messages = ['This', 'is', 'loaded', 'text.'];
      //   var messagesContainer = querySelector('message-container');
      //   String defaultText = '<p>This user has no posts yet.</p>';
      //   messagesContainer.text = messages.length == 0 ? defaultText : '';
      //   for (var message in messages) {
      //     var messageDiv = buildMessageDiv(message);
      //     messagesContainer.children.add(messageDiv);
      //   }
      // });
}

/**
 * Builds an element that displays the message.
 * @param {Message} message
 * @return {Element}
 */
DivElement buildMessageDiv(String message) {
  DivElement headerDiv = new DivElement();
  final textNode = new Text('tmp user' + ' - ' + 'tmp datetime');
  headerDiv.classes.add('message-header');
  headerDiv.append(textNode); //new Date(message.timestamp))); //TODO

  DivElement bodyDiv = new DivElement();
  bodyDiv.classes.add('message-body');
  bodyDiv.text = 'tmp text'; //message.text;

  DivElement messageDiv = new DivElement();
  messageDiv.classes.add('message-div');
  messageDiv.children.add(headerDiv);
  messageDiv.children.add(bodyDiv);

  return messageDiv;
}

/** Fetches data and populates the UI of the page. */
void main() {
  // Get ?user=XYZ parameter value
  var uri = Uri.parse(window.location.toString());
  var parameterUsername = null;
  uri.queryParameters.forEach((key, val) {
     if (key == 'user') {
       parameterUsername = val;
     }
  });

  // URL must include ?user=XYZ parameter. If not, redirect to homepage.
  if (parameterUsername == null) {
    window.location.replace('/');
  }


  setPageTitle(parameterUsername);
  showMessageFormIfViewingSelf();
  fetchMessages();
}
