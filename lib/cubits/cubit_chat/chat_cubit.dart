import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../models/message.dart';
import 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatDefault());
  CollectionReference messages =
  FirebaseFirestore.instance.collection(kMessagesCollections);



  void sendMessage(
      {required String message,
      required String email,

   }) {
    messages.add(
      {kMessage: message, kCreatedAt: DateTime.now(), 'id': email},
    );
  }

  void getMessages() {
    List<Message> messagesList = [];
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event){


       messagesList.clear();
      for (var element in event.docs) {
        messagesList.add(Message.fromJson(element.data()));
      }
      emit(ChatSuccess(messagesList));
    });


  }

}
