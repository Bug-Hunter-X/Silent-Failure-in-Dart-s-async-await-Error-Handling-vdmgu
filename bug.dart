```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success!
      final data = jsonDecode(response.body);
      // Process the data
    } else {
      // Handle error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e'); // This will print the error, but won't rethrow it
    //This is the bug.  The error is caught, printed but not re-thrown or handled.
    //The calling function may not know an error occurred. 
  }
}
```