import 'package:flutter/material.dart';

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
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Address',
            ),
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
              labelText: 'Monthly goal (13,000 liters by default)',
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text('You successfully disconnected from the account!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                child: Text('Disconnect from the account')),
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

