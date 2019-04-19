import 'package:flutter/material.dart';
import 'package:my_community_app/screens/home/chats/people_card.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() {
    return _ChatsScreenState();
  }
}

class _ChatsScreenState extends State<ChatsScreen> {
  final _tabCount = 2;
  final _query = TextEditingController();

  Widget _buildTabTitle(String text) {
    return Container(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _query,
              onChanged: (String
                      text) {} /* =>
                    setState(() => _isComposing = text.length > 0)*/
                  ,
              onSubmitted: (String text) {} /*_handleSubmited*/,
              decoration: new InputDecoration.collapsed(hintText: "Search"),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed:
                      () {} /*_isComposing
                    ? () => _handleSubmited(_textController.text)
                    : null*/
                  ,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    AppBar bar = AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(26.0),
        child: Column(
          children: <Widget>[
            _buildSearch(),
            TabBar(
              tabs: [
                _buildTabTitle('Message'),
                _buildTabTitle('People'),
              ],
              indicatorColor: Colors.black,
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
    );
    return bar;
  }

  Widget _buildChatsScreen() {
    return Column(
      children: <Widget>[
        PeopleCard(name: 'Johnny Depp'),
        PeopleCard(name: 'Andryut Huertas'),
      ],
    );
  }

  Widget _buildPeopleScreen() {
    return Container();
  }

  Widget _buildBody() {
    Widget body = TabBarView(
      children: [
        _buildChatsScreen(),
        _buildPeopleScreen(),
      ],
    );
    return body;
  }

  Widget _buildTabView() {
    return DefaultTabController(
      length: _tabCount,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTabView();
  }
}
