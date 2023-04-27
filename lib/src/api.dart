/// Import the required libraries
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:savely/src/strings.dart';

class API {
  /// The [http.Client] instance for making HTTP requests
  final http.Client client;

  /// The URL of the data to convert
  final String dataUrl;

  API({
    required this.client,
    required this.dataUrl,
  });

  /// The website of the data
  late String _website = '';

  /// The source of the data
  late String _source = '';

  /// The title of the data
  late String _title = '';

  /// The duration of the data
  late dynamic _duration ;

  /// The thumbnail image URL of the data
  late String _thumbnail = '';

  /// The list of URLs for the different qualities and types of the data
  late List<Map<String, dynamic>> _urls = [];

  Future<Map<String, dynamic>> convert() async {
    /// Create the [Uri] object for the API endpoint
    final Uri apiUrl = Uri.parse(api);

    /// This [headers] map is used to set the headers for the http request.
    final headers = {
      'authority': authority,
      'accept': '*/*',
      'accept-Language': 'en-US,en;q=0.9,en-GB;q=0.8',
      'cache-Control': 'no-cache',
      'content-Type': 'application/json',
      'origin': host,
      'pragma': 'no-cache',
      'referer': referer,
      'sec-fetch-dest': 'empty',
      'sec-fetch-mode': 'cors',
      'sec-fetch-site': 'same-origin',
      'User-Agent': userAgent,
      'sec-ch-ua': secChUa,
    };

    /// The [requestData] string is used to set the data for the http request.
    final requestData = '{"url":"$dataUrl"}';

    /// This [response] variable is used to store the http response.
    var response = await client.post(apiUrl,
        headers: headers, body: requestData, encoding: utf8);

    /// Check the http status code of the response and return the appropriate response.
    if (response.statusCode == 200) {
      /// Decode the body.
      final jsonResponse = json.decode(response.body);

      _source = jsonResponse['meta']['source'] as String? ?? '';
      _title = jsonResponse['meta']['title'] as String? ?? '';
      _duration = jsonResponse['meta']['duration'] as dynamic ?? '';
      _thumbnail = jsonResponse['thumb'] as String? ?? '';
      _website = Uri.parse(dataUrl).host;

      for (var item in jsonResponse['url']) {
        Map<String, dynamic> urlMap = {
          'url': item['url'] as String? ?? '',
          'quality': item['subname'] as String? ?? '',
          'type': item['name'] as String? ?? '',
          'noVideoSound': item['no_audio'] as bool? ?? false,
          'isJustAudio': item['audio'] as bool? ?? false,
        };

        _urls.add(urlMap);
      }

      /// Return the map
      return {
        'source': _source,
        'title': _title,
        'duration': _duration.toString(),
        'thumbnail': _thumbnail,
        'website': _website,
        'data': _urls
      };
    } else if (response.statusCode != 200) {
      /// Throw an exception if the response status code is not 200 or 201
      throw Exception('code : ${response.statusCode}');
    } else {
      /// Throw an exception if there was a failure to fetch the data
      throw Exception('Failed to get data');
    }
  }
}
