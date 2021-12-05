import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multilang/LanguageChangeProvider.dart';
import 'package:multilang/generated/l10n.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocaleLang,
          supportedLocales: [
            Locale('en', ''),
            Locale('fa', ''),
          ],
          localizationsDelegates:[
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Welcome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).Hello,
            ),
            InkWell(
              onTap: (){
                new Locale('en');
                context.read<LanguageChangeProvider>().ChangeLocale('en');
                print(S.of(context).Hello);
              },
              child: Text('en'),
            ),
            InkWell(
              onTap: (){
                new Locale('fa');
                context.read<LanguageChangeProvider>().ChangeLocale('fa');
                print(S.of(context).Hello);
              },
              child: Text('fa'),
            ),
          ],
        ),
      ),
    );
  }
}
