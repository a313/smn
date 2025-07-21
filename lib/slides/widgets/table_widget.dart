import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  final List<List<String>> table;
  const TableWidget({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(color: Colors.white),
        children:
            table.map((row) {
              return TableRow(
                children:
                    row.map((cell) {
                      return TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cell,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }).toList(),
              );
            }).toList(),
      ),
    );
  }
}
