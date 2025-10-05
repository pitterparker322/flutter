import 'package:flutter/material.dart';
import 'package:book_store/models/resuorces.dart';



class Cards extends StatefulWidget {
  final Book book;
  const Cards({super.key, required this.book});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {


    @override
  Widget build(BuildContext context){
      return Container(
        // height: double.infinity,
        // width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Card(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRect(
                child: Image.asset(
                    widget.book.imageUrl,
                alignment: Alignment.center,
                height: 100,
                width: double.infinity,
                fit:BoxFit.cover,
                ),
                ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.book.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              Text(
                widget.book.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    widget.book.tags,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
              const Spacer(),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Download'),
                ),
              ),
            ],
          ),
        ),
      );
    }
}
