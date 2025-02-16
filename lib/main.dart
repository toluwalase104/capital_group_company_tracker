import 'dart:collection';

import 'package:company_interest_tracker/company_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'company_input_form.dart';
import 'company_list.dart';

// import 'company_input_form.dart';

void main() {
  runApp(const MyApp());
}

/* MAIN APP */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = "Company Interest Tracker";
    
    return ChangeNotifierProvider(
      create : (context) => MyAppState(),
      child: MaterialApp(
          title: appTitle,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            useMaterial3: true,
          ),
      
          // Defines the structure of the app
          home: const HomePage(title: appTitle,),
        ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  List<String> _companyNames = [];

  HashMap<String, CompanyData> _companyMap = HashMap<String, CompanyData>();

  int _numberOfCompanies = 0;
  get numberOfCompanies => _numberOfCompanies;

  // Add a company to the company set and
  // update anything watching this notifier
  void addCompany(String company){
    // Do not allow duplicate entries
    if (_companyMap.containsKey(company)){
      return;
    }

    _companyNames.add(company);
    _companyMap.putIfAbsent(company, () => CompanyData(company));

    ++_numberOfCompanies;

    notifyListeners();
  }

  // Remove a company from the company set and
  // update anything watching this notifier
  void removeCompany(String company){

    // Cannot remove non-existent items, so we cease further operations
    if (!_companyMap.containsKey(company)){
      return;
    }

    _companyNames.remove(company);
    _companyMap.remove(company);
    --_numberOfCompanies;

    notifyListeners();
  }

  void removeIthCompany(int i){
    if (i < 0 || i >= _numberOfCompanies){
      return;
    }

    String companyToBeRemoved = _companyNames[i];

    _companyMap.remove(companyToBeRemoved);
    _companyNames.removeAt(i);
    --_numberOfCompanies;

    notifyListeners();
  }

  String getIthCompany(int i){
    if (i < 0 || i >= _numberOfCompanies){
      return "";
    }

    return _companyNames[i];
  }

  bool noCompaniesAdded(){
    return _companyNames.isEmpty;
  }

}

class HomePage extends StatelessWidget {
  final String _appTitle;

  const HomePage({super.key, required String title})
    :_appTitle = title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
            appBar : AppBar(title: Text(_appTitle)),
            body : Column(
              children: [
                const CompanyInputForm(),
                const Expanded(
                  child: CompanyList()
                ),
              ],
            ),
          );
  }
}

/* END OF MAIN APP */