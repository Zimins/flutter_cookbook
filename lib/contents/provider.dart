import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../githubWidget.dart';
import 'contentlist.dart';

class ProviderDemo implements CookItem {
  @override
  String title = "Provider";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _ProviderPage();
    }));
  }
}

class _ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WordsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => RandomWordRepo(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider example"),
        ),
        floatingActionButton: GithubLink(
          link: "contents/provider.dart",
        ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "You can add random value to WordsNotifier provided by Provider"),
                  ),
                  AddItemButton(),
                  RemoveItemWidget(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Updated Card by Consumer<WordsNotifier>"),
                  ),
                  Consumer<WordsNotifier>(
                    builder: (context, words, widget) {
                      return Card(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            RandomWordContainer(),
                            LoadingIndicator(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RandomWordRepo>(
      builder: (context, repo, child) {
        if (repo.showLoading) {
          return Column(
            children: <Widget>[
              CircularProgressIndicator(),
              Text("Load initial items from server...")
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class RandomWordContainer extends StatelessWidget {
  final WordsNotifier words;

  RandomWordContainer(this.words);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: words.items
            .map<Widget>((item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item),
                ))
            .toList());
  }
}

class RemoveItemWidget extends StatelessWidget {
  const RemoveItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: OutlineButton(
        child: Text("Remove word"),
        onPressed: () async {
          Provider.of<WordsNotifier>(context, listen: false).removeItem();
        },
      ),
    );
  }
}

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: OutlineButton(
        child: Text("Add random word"),
        onPressed: () async {
          final word = await Provider.of<RandomWordRepo>(context, listen: false)
              .getRandomWord();
          Provider.of<WordsNotifier>(context, listen: false).addItem(word);
        },
      ),
    );
  }
}

class WordsNotifier extends ChangeNotifier {
  List<String> _items = [];
  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem() {
    _items.removeAt(0);
    notifyListeners();
  }
}

class RandomWordRepo extends ChangeNotifier {
  List<String> _randomWords = [];
  int _wordIndex = 0;
  bool showLoading = false;

  Future<http.Response> fetchRandomWords() async {
    showLoading = true;
    notifyListeners();
    final response =
        await http.get("https://random-word-api.herokuapp.com/word?number=500");
    showLoading = false;
    notifyListeners();
    return response;
  }

  Future<String> getRandomWord() async {
    if (_randomWords.isEmpty) {
      http.Response response = await fetchRandomWords();
      if (response.statusCode == 200) {
        List<dynamic> words = jsonDecode(response.body);
        _randomWords.addAll(words.map<String>((item) => item.toString()));
      }
    }

    final index = _wordIndex++ % _randomWords.length;
    return _randomWords[index];
  }
}
