import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 37, 37),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Abyssinia',
          style: TextStyle(
            color: Colors.red,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, Colors.black]),
          ),
        ),
      ),
      body: Expanded(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Abyssinia Book Store',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            Container(
              height: 600,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Abyssinia Book Store is a community-driven book-sharing platform designed specifically for university students across Ethiopia. Our mission is to make educational resources more accessible, affordable, and collaborative.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'With Abyssinia Book Store, You can:',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 15,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "#  Share and download textbooks, lecture notes, research papers, and study guides.",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          "#  Discover resources from universities across the country.",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          "#  Connect with fellow students to exchange knowledge and ideas.",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Join the AbyssiniaBook community today — because sharing knowledge is the first step toward a brighter future!',
                              style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
