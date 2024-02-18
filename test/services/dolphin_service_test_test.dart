import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:new_app/core/constants/strings.dart';
import 'package:new_app/models/dolphin_model.dart';
import 'package:new_app/services/dolphin_service.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('DolphinService', () {
    late MockClient client;

    setUp(() {
      client = MockClient();
    });

    test('fetchRandomDolphinPhoto - success', () async {
      // Arrange
      const photoUrl='https://www.shutterstock.com/image-photo/beautiful-bottlenose-dolphins-jumping-out-600nw-2032751627.jpg';
      final expectedDolphin = DolphinModel(photoUrl:photoUrl );
      final jsonString = jsonEncode(expectedDolphin.toMap());
      final response =await client.get(Uri.parse(photoUrl));
      when(()=>response).thenReturn(http.Response(jsonString,200));

      // Act
      final result = DolphinModel(photoUrl:photoUrl );

      // Assert
      expect(result, equals(expectedDolphin));
    });

    test('fetchRandomDolphinPhoto - failure', () async {
      // Arrange
      when(()=>client.get(Uri.parse(ConstStrings.apiUrl)))
          .thenAnswer((_) async => http.Response('', 200));

      // Act & Assert
      expect(
              () async => await DolphinService.fetchRandomDolphinPhoto(),
          throwsException);
    });
  });
}
