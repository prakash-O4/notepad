import 'package:hive_flutter/hive_flutter.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel {
  @HiveField(0)
  final String heading;
  @HiveField(1)
  final String number;
  ExpenseModel({required this.heading, required this.number});
}

List<ExpenseModel> expenseModels = [];
