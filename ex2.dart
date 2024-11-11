import 'package:flutter/material.dart';

class FavoriteCardsWidget extends StatefulWidget {
  @override
  _FavoriteCardsWidgetState createState() => _FavoriteCardsWidgetState();
}

class _FavoriteCardsWidgetState extends State<FavoriteCardsWidget> {
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