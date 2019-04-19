import 'package:flutter/material.dart';

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
      title: _buildSearch(),
      bottom: TabBar(
        tabs: [
          _buildTabTitle('Message'),
          _buildTabTitle('People'),
        ],
        indicatorColor: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
    );
    return bar;
  }

  Widget _buildChatsScreen() {
    return Container();
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
