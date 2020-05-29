import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF832685),
        primaryColorLight: Color(0xFFC81379),
        accentColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String title = 'AnimatedIcon';

  AnimationController _animationController;
  var _playButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _play() async {
    setState(() {
      _playButtonEnabled = false;
    });
    await _animationController.forward(from: 0.0);
    await Future.delayed(Duration(seconds: 3));
    await _animationController.reverse();
    setState(() {
      _playButtonEnabled = true;
    });
  }

  Widget _buildAnimatedIcon(AnimatedIconData icon, {@required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedIcon(
          icon: icon,
          progress: _animationController,
          size: 48.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      floatingActionButton: _playButtonEnabled
          ? FloatingActionButton(
              backgroundColor: Colors.purple,
              onPressed: _play,
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 36.0,
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              _buildAnimatedIcon(AnimatedIcons.menu_arrow, label: 'Menu Arraow'),
              _buildAnimatedIcon(AnimatedIcons.arrow_menu, label: 'Arraow Menu'),

              _buildAnimatedIcon(AnimatedIcons.home_menu, label: 'Home Menu'),
              _buildAnimatedIcon(AnimatedIcons.menu_home, label: 'Menu Home'),

              _buildAnimatedIcon(AnimatedIcons.close_menu, label: 'Close Menu'),
              _buildAnimatedIcon(AnimatedIcons.menu_close, label: 'Menu Close'),

              _buildAnimatedIcon(AnimatedIcons.event_add, label: 'Event Add'),
              _buildAnimatedIcon(AnimatedIcons.add_event, label: 'Add Event'),

              _buildAnimatedIcon(AnimatedIcons.list_view, label: 'List View'),
              _buildAnimatedIcon(AnimatedIcons.view_list, label: 'View List'),

              _buildAnimatedIcon(AnimatedIcons.pause_play, label: 'Pause Play'),
              _buildAnimatedIcon(AnimatedIcons.play_pause, label: 'Play Pause'),

              _buildAnimatedIcon(AnimatedIcons.ellipsis_search, label: 'Ellipsis Search'),
              _buildAnimatedIcon(AnimatedIcons.search_ellipsis, label: 'Search Ellipsis'),
            ],
          ),
        ),
      ),
    );
  }
}
