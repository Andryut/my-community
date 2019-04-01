import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_community_app/screens/individual_chat_bar.dart';
import 'package:my_community_app/screens/group_chat_bar.dart';
import 'package:my_community_app/screens/chat_message.dart';
import 'package:my_community_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  final Map<String, dynamic> _properties;

  ChatScreen({@required properties}) : _properties = properties;

  @override
  _ChatScreenState createState() => _ChatScreenState(properties: _properties);
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;
  final Map<String, dynamic> _properties;

  _ChatScreenState({@required properties}) : _properties = properties;

  void _handleSubmited(String text) {
    _textController.clear();
    setState(() => _isComposing = false);
    Firestore.instance.runTransaction((transaction) async {
                await transaction
                    .set(null, {"text" : text, "owner" : "owner", "imageUrl" : "imageUrl", "date" : ""});
              });
  }

  Widget _buildMessages() {
    return Flexible(
        child: StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('chats').snapshots(),
      builder: (context, snapshot) => !snapshot.hasData
          ? LinearProgressIndicator()
          : _buildList(context, snapshot.data.documents),
    ));
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      reverse: true,
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),

    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final message = Message.fromSnapshot(data);

    return ChatMessage(
      text: message.text,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
      owner: message.owner,
      imageUrl: message.imageUrl,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _properties["chatType"] == "group"
          ? GroupChatBar(properties: _properties)
          : IndividualChatBar(properties: _properties),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (String text) =>
                    setState(() => _isComposing = text.length > 0),
                onSubmitted: _handleSubmited,
                decoration: new InputDecoration.collapsed(
                    hintText: "Type a message here"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                color: Colors.blue[400],
                onPressed: _isComposing
                    ? () => _handleSubmited(_textController.text)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          _buildMessages(),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: new Border(top: new BorderSide(color: Colors.grey[200])),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.insert_emoticon),
          color: Colors.grey[400],
          onPressed: () => true,
        ),
        IconButton(
          icon: Icon(Icons.attach_file),
          color: Colors.grey[400],
          onPressed: () => true,
        ),
        IconButton(
          icon: Icon(Icons.camera_alt),
          color: Colors.grey[400],
          onPressed: () => true,
        ),
        IconButton(
          icon: Icon(Icons.image),
          color: Colors.grey[400],
          onPressed: () => true,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}