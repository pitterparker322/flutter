import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:book_store/models/resuorces.dart';
import 'package:book_store/custom_widgets/book_cards.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  List<Book> _books = [];

  Future<void> loadBooks() async {
    final String response = await rootBundle.loadString('assets/books.json');
    final List<dynamic> data = jsonDecode(response);

    setState(() {
      _books = data.map((json) => Book.fromJson(json)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 37, 37),
      body: _books.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // show 2 cards per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: _books.length,
                  itemBuilder: (context, index) {
          return Cards(book: _books[index]); // 👈 passing book here
                  },
                ),
    );
  }
}
