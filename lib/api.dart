import 'package:http/http.dart' as http;

Future Getdata(url) async {
  http.Response res = await http.get(url);
  return res.body;
}
