```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success!
      final data = jsonDecode(response.body);
      // Process the data
    } else {
      // Handle error by re-throwing the exception
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e');
    //Re-throw the error to be handled by the calling function.
    rethrow; //This line is crucial to propogate the error.
  }
}
```