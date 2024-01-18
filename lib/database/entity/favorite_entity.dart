import 'package:drift/drift.dart';

class Favorite extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mealsId => text().named('meals_id')();
  TextColumn get mealsName => text().named('meals_name')();
  TextColumn get mealsThumbnail => text().named('meals_thumbnail')();
  TextColumn get mealsArea => text().named('meals_area')();
  TextColumn get mealsInstruction => text().named('meals_instruction')();
  TextColumn get mealsCategory => text().named('meals_category')();
}
