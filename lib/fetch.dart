import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchAndPrintUsers() async {
  String url = 'https://random-data-api.com/api/v2/users?size=10';

  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> users = json.decode(response.body);
      for (var user in users) {
        String uid = user['uid'];
        String firstName = user['first_name'];
        String lastName = user['last_name'];
        print('$uid: $firstName $lastName');
      }
    } else {
      throw 'Failed to load user data';
    }
  } on FormatException {
    print('The provided data is not in the expected format.');
  } on Exception catch (ex) {
    print('A general exception occurred: $ex');
  } catch (ex, st) {
    print('Exception details: \n$ex');
    print('Stack trace: \n$st');
  } finally {
    print('\nUser fetch completed.');
  }
}

