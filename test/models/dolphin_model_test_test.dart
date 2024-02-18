import 'package:flutter_test/flutter_test.dart';
import 'package:new_app/models/dolphin_model.dart';

void main() {
  group('DolphinModel', () {
    test('Constructor initializes photoUrl', () {
      // Arrange
      const photoUrl = 'https://www.example.com/image.jpg';

      // Act
      final dolphin = DolphinModel(photoUrl: photoUrl);

      // Assert
      expect(dolphin.photoUrl, equals(photoUrl));
    });

    test('fromMap creates DolphinModel instance from map', () {
      // Arrange
      final map = {'photoUrl': 'https://www.example.com/image.jpg'};

      // Act
      final dolphin = DolphinModel.fromMap(map);

      // Assert
      expect(dolphin.photoUrl, equals(map['photoUrl']));
    });

  });
}
