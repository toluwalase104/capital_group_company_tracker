import 'package:company_interest_tracker/company_data.dart';
import 'package:flutter/material.dart';

// A widget that allows the data stored about a company to be viewed and editted accordingly
class CompanyWidget extends StatelessWidget {
  final CompanyData _data;

  const CompanyWidget({super.key, required CompanyData companyData})
    : _data = companyData;
    
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      // Allows the exta information to be closed
                      ElevatedButton(
                        child: const Text('Exit'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}