import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_jedmendoza/main.dart';

void main() {
  testWidgets('Directory shows header and student cards', (tester) async {
    await tester.pumpWidget(const DirectoryApp());

    expect(find.text('Campus Directory'), findsOneWidget);
    expect(find.text('Students'), findsOneWidget);
    expect(find.text('Ana Cruz'), findsOneWidget);
    expect(find.byType(StudentCard), findsWidgets);
  });

}