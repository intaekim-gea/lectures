import 'package:flutter/material.dart';
import 'package:string_service_plugin/string_service_plugin.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final stringService = StringServicePlugin();
  final strings = <String>[];

  @override
  void initState() {
    _reload();
    super.initState();
  }

  void _reload() {
    stringService.retrieveAllData().then(
          (value) => setState(
            () {
              strings.clear();
              strings.addAll(value);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            TextButton(
              onPressed: () async {
                final string = await Navigator.of(context).push<String?>(
                  MaterialPageRoute(
                    builder: (context) => const AddStringWidget(),
                  ),
                );
                if (string != null) {
                  stringService.addString(string).then((_) => _reload());
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
        body: Center(
          child: ListView.separated(
            itemCount: strings.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(strings[index]),
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      );
}

class AddStringWidget extends StatefulWidget {
  const AddStringWidget({super.key});

  @override
  State<AddStringWidget> createState() => _AddStringWidgetState();
}

class _AddStringWidgetState extends State<AddStringWidget> {
  final textController = TextEditingController();

  @override
  void initState() {
    textController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Input String')),
        body: Center(
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: textController,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: textController.text.isNotEmpty
                    ? () => Navigator.of(context).pop(textController.text)
                    : null,
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      );
}
