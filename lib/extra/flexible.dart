import 'package:flutter/material.dart';

class MyFlex extends StatelessWidget {
  const MyFlex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flex')),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.blue[100],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 100,
              color: Colors.red[100],
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
                height: 100,
                color: Colors.pink,
                child: Wrap(
                  children: [
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                    TextButton(
                      child: Text('onk'),
                      onPressed: () => {},
                    ),
                  ],
                )),
          ),
          Flexible(
            flex: 3,
            child: CircleAvatar(
              radius: 100,
              child: Image.asset('./images/fb.png'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Hide'),
        onPressed: () => {},
      ),
    );
  }
}
