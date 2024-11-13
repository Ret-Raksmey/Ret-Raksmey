import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        //body: FavoriteCards(),
      ),
    );
  }
}
class FavoriteCards extends StatefulWidget {
  @override
  _FavoriteCardsWidgetState createState() => _FavoriteCardsWidgetState();
}

class _FavoriteCardsWidgetState extends State<FavoriteCards> {
  List<Map<String, dynamic>> _favoriteCards = [
    {'title': 'title', 'description': 'description', 'isFavorite': true},
    {'title': 'title', 'description': 'description', 'isFavorite': false},
    {'title': 'title', 'description': 'description', 'isFavorite': true},
  ];

  void _toggleFavorite(int index) {
    setState(() {
      _favoriteCards[index]['isFavorite'] = !_favoriteCards[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _favoriteCards.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_favoriteCards[index]['title']),
                          SizedBox(height: 8),
                          Text(_favoriteCards[index]['description']),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _favoriteCards[index]['isFavorite']
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: _favoriteCards[index]['isFavorite']
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onPressed: () => _toggleFavorite(index),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}