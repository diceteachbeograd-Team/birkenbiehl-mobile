import 'package:app/features/learning/services/seed_content_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('loads templates from bundled seed asset', () async {
    const repo = SeedContentRepository();
    final templates = await repo.loadTemplatesOrFallback();

    expect(templates, isNotEmpty);
    expect(templates.first.id, contains('a1.1'));
    expect(templates.first.steps.length, 5);
  });
}
