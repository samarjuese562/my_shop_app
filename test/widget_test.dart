import 'package:flutter_test/flutter_test.dart';
import 'package:my_shop_app/main.dart';

void main() {
  testWidgets('Home page loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyShopApp());

    // نتأكد إن الصفحة الرئيسية فيها نص MyShop App
    expect(find.text('MyShop App'), findsOneWidget);
  });
}
