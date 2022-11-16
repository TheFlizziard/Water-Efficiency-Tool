import 'package:flutter/material.dart';

import './main.dart';

//TODO Add scrolling function

class InfoField extends StatelessWidget {
  const InfoField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Name',
            ),
            initialValue: MyApp.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Address',
            ),
            initialValue: MyApp.address,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
          child: DropdownCurrencies(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          child: DropdownMetrics(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
          child: TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Monthly goal',
                helperText: 'By default: 13,000 liters'),
            initialValue: "13,000",
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () {
                  const snackBar = SnackBar(
                    content: Text(
                        'Your changes have been successfully saved!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //TODO SAVING CHANGES
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // background
                  foregroundColor: Colors.white, // foreground
                ),
                child: const Text('Save changes')),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text(
                        'You successfully disconnected from the account!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginManager()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // background
                  foregroundColor: Colors.white, // foreground
                ),
                child: const Text('Disconnect from the account')),
          ),
        )
      ],
    );
  }
}

class DropdownButtonField extends StatefulWidget {
  final List<String> dropdownList;

  const DropdownButtonField({super.key, required this.dropdownList});

  @override
  State<DropdownButtonField> createState() => _DropdownButtonFieldState();
}

class _DropdownButtonFieldState extends State<DropdownButtonField> {
  late String dropdownValue = widget.dropdownList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.indigoAccent),
      underline: Container(height: 2, color: Colors.blueAccent),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      isExpanded: true,
      items: widget.dropdownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropdownCurrencies extends StatelessWidget {
  final List<String> currenciesList = <String>[
    '₩ (KRW)',
    '€ (EUR)',
    '\$ (USD)',
    '¥ (JPY)'
  ];

  DropdownCurrencies({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: DropdownButtonField(dropdownList: currenciesList));
  }
}

class DropdownMetrics extends StatelessWidget {
  final List<String> metricsList = <String>[
    'L (Liter)',
    'M3 (Cubic Meter)',
    'gal (Gallons)'
  ];

  DropdownMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: DropdownButtonField(dropdownList: metricsList));
  }
}
