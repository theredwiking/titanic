import 'package:flutter/material.dart';
import 'package:titanic/db/database.dart';
import 'package:titanic/l10n/l10n.dart';
import 'package:titanic/pages/question_packs.dart';
import 'package:titanic/pages/settings.dart';
import 'pages/gamemode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((instance) {
    String? lang = instance.getString('language');
    lang ??= 'en';
    runApp(MyApp(lang: lang,));
  });
}

class MyApp extends StatelessWidget {
  final String? lang;
  const MyApp({super.key, required this.lang});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titanic',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF231651),
        useMaterial3: true,
      ),
      supportedLocales: L10n.all,
      locale: Locale(lang!),
      localizationsDelegates:  const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
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
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    DB database = DB();
    database.copyDb('questions_english.db');
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset('assets/pictures/branding_${AppLocalizations.of(context)!.localeName}.png'),
            const SizedBox(height: 100,),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFCECC9),
                  minimumSize: const Size(263, 88)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GamemodePage()));
              },
              child: Text(AppLocalizations.of(context)!.chooseModeBtn,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(height: 33),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFCECC9),
                minimumSize: const Size(263, 88),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionPacksPage()));
              },
              child: Text(AppLocalizations.of(context)!.questionsBtn,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(height: 33),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFCECC9),
                minimumSize: const Size(263, 88),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
              child: Text(AppLocalizations.of(context)!.settingsBtn,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
