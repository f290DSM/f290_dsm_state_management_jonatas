import 'package:f290_dsm_state_management_jonatas/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final pages = const [PageOne(), PageTwo(), PageThree()];

  @override
  Widget build(BuildContext context) {
    print("build...");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter Provider"),
      ),
      body: pages[context.watch<CounterProvider>().selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: context.watch<CounterProvider>().selectedIndex,
        onDestinationSelected: (value) =>
            context.read<CounterProvider>().changeIndex(value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.android_outlined),
            selectedIcon: Icon(Icons.android),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.adb_outlined),
            selectedIcon: Icon(Icons.adb),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Home',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 300,
        color: Colors.blue.shade200,
        child: Text(
          '${context.watch<CounterProvider>().counter}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 300,
        color: Colors.pink.shade200,
        child: Text(
          '${context.watch<CounterProvider>().counter}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 300,
        color: Colors.orange.shade200,
        child: Text(
          '${context.watch<CounterProvider>().counter}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
