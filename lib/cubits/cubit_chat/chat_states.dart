import '../../models/message.dart';

abstract   class ChatStates {
  List<Message> messageList ;
  ChatStates(this.messageList);
}

class ChatSuccess extends ChatStates{

  ChatSuccess(List<Message> messageList) : super(messageList);
}
class ChatDefault extends ChatStates{
  ChatDefault() : super([]);

}
