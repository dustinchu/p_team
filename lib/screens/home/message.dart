// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart';
// import 'package:flutter/material.dart';

// class Message {
//   final age;
//   final lname;
//   const Message(this.age, this.lname);
// }

// class ChatList extends StatelessWidget {
//   Firestore store = firestore();
//   Stream<List<Message>> getData() async* {
//     var messagesStream = store.collection("employee").onSnapshot;
//     var messages = List<Message>();
//     await for (var messagesSnapshot in messagesStream) {
//       for (var messageDoc in messagesSnapshot.docs) {
//         print(messageDoc);
//         var message;
//         // if (messageDoc.data()["uid"] != null) {
//         //   var userSnapshot = await Firestore.instance.collection("users").document(messageDoc["uid"]).get();
//         //   message = Message(messageDoc["message"], messageDoc["timestamp"], messageDoc["uid"], userSnapshot["name"]);
//         // }
//         // else {
//         //   message = Message(messageDoc["message"], messageDoc["timestamp"], "", "");
//         // }
//         message = Message(messageDoc.data()["age"], messageDoc.data()["lname"]);
//         messages.add(message);
//       }
//       yield messages;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var streamBuilder = StreamBuilder<List<Message>>(
//         stream: getData(),
//         builder: (BuildContext context,
//             AsyncSnapshot<List<Message>> messagesSnapshot) {
//           if (messagesSnapshot.hasError)
//             return new Text('Error: ${messagesSnapshot.error}');
//           switch (messagesSnapshot.connectionState) {
//             case ConnectionState.waiting:
//               return new Text("Loading...");
//             default:
//               return new ListView(
//                   children: messagesSnapshot.data.map((Message msg) {
//                 return new ListTile(
//                   title: new Text(msg.age),
//                   subtitle: new Text(msg.lname),
//                 );
//               }).toList());
//           }
//         });
//     return streamBuilder;
//   }
// }
