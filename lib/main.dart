import 'package:exercise/state_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<StateData>(
    create: (BuildContext context) => StateData(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('callback kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Expanded(child: SolWidgetA()),
            const Expanded(child: SagWidgetA())
          ],
        ),
      ),
    );
  }
}

class SolWidgetA extends StatelessWidget {
  const SolWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? sehir = Provider.of<StateData>(context).sehir;
    return Container(
        color: Colors.yellow,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Sol Widget',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Şehir: $sehir',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'İlçe: ${Provider.of<StateData>(context).ilce}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Mahalle: ${Provider.of<StateData>(context).mahalle}',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}

class SagWidgetA extends StatelessWidget {
  const SagWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(children: [
        const Text(
          'SagWidget A',
          style: TextStyle(fontSize: 20),
        ),
        const SagWidgetB()
      ]),
    );
  }
}

class SagWidgetB extends StatelessWidget {
  const SagWidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(children: [
        const Text(
          'SagWidget B',
          style: TextStyle(fontSize: 20),
        ),
        const SagWidgetC()
      ]),
    );
  }
}

class SagWidgetC extends StatelessWidget {
  const SagWidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function newCity = Provider.of<StateData>(context).newCity;
    return Container(
      color: Colors.white,
      height: 150,
      width: 160,
      child: Column(children: [
        const Text(
          'SagWidget C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Şehir: ${Provider.of<StateData>(context).sehir} ',
          style: const TextStyle(fontSize: 20),
        ),
        TextField(onChanged: (input) {
          newCity(input);
        })
      ]),
    );
  }
}
