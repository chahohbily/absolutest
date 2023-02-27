import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ipr/app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: SliverAppBarExample(controller: scrollController),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title: const Text('SliverAppBar Example'),
            expandedHeight: 400,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://fikiwiki.com/uploads/posts/2022-02/1644855597_24-fikiwiki-com-p-kartinki-khd-kachestva-25.jpg',
                fit: BoxFit.cover,
              ),
            ),
            onStretchTrigger: () async {
              log('message');
              return;
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item $index')),
              childCount: 6,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(
              6,
              (index) => Container(
                color: Colors.blue[100 * (index % 9)],
                child: Center(
                  child: Text(
                    'Grid Item $index',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
