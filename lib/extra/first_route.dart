import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Route"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text("Go"),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              )
            },
          ),
          ElevatedButton(
            onPressed: () {
              final snackbar = SnackBar(
                content: const Text('Yea it is snackBar'),
                action: SnackBarAction(
                  label: 'undo',
                  onPressed: () => {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            child: const Text("Show snakBar"),
          )
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Route"),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Back"),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
        ));
  }
}

class MyIntroductionPage extends StatelessWidget {
  const MyIntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showNextButton: true,
      next: Text('Next'),
      done: const Text('Done'),
      onDone: () => print('done'),
      pages: [
        PageViewModel(
          title: "First page",
          body:
              "here are some text to show in the screen, and it woun't go in productio mode",
          footer: ElevatedButton(
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Lets',
                  style: TextStyle(
                    backgroundColor: Colors.blueAccent,
                    color: Colors.red,
                  ),
                ),
                TextSpan(text: 'go')
              ]),
            ),
            onPressed: () => {},
          ),
          image: Center(
            child: Image.asset('/home/ihzonaid/Pictures/tankyou.jpg'),
          ),
        ),
        PageViewModel(
          title: "2nd page",
          body:
              "here are some text to show in the screen, and it woun't go in productio mode",
          footer: ElevatedButton(
            child: const Text('Lets Go'),
            onPressed: () => {},
          ),
        ),
        PageViewModel(
          title: "Third page",
          body:
              "here are some text to show in the screen, and it woun't go in productio mode",
          footer: ElevatedButton(
            child: const Text('Lets Go'),
            onPressed: () => {},
          ),
        ),
      ],
    );
  }
}
