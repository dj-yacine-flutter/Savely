/// This file contains the [Savely] class which is responsible for retrieving
/// data from a video sharing website using its URL.
///
/// It uses the [API] class to fetch the data.
///
/// Example usage:
///
/// /// final Savely savely = Savely(); /// await savely.down(videoUrl); /// print(savely.source); /// print(savely.duration); /// ... ///

import 'package:http/http.dart' as http;
import 'package:savely/src/api.dart';

/// The [Savely] class is responsible for retrieving data from a social media
/// website using its URL.
class Savely {
  /// The [http.Client] instance for making HTTP requests.
  final _client = http.Client();

  /// The source of the video.
  late String source;

  /// The title of the video.
  late String title;

  /// The duration of the video.
  late String duration;

  /// The thumbnail of the video.
  late String thumbnail;

  /// The website hosting the video.
  late String website;

  /// The data for the video, including URLs, qualities, and types.
  late List<Map<String, dynamic>> data;

  /// Creates a new instance of the [Savely] class.
  Savely();

  /// Fetches the data for the video specified by [videoUrl].
  ///
  /// Example usage:
  ///
  /// final Savely savely = Savely();
  ///
  ///
  /// await savely.down(videoUrl);
  ///
  ///
  /// print(savely.source);
  /// print(savely.duration);
  Future<Map<String, dynamic>> down(String videoUrl) async {
    final supportedDomains = [
      'dailymotion',
      'facebook',
      'instagram',
      'ok',
      'reddit',
      'soundcloud',
      'twitter',
      'vimeo',
      'vk',
      'youtu',
    ];

    final uri = Uri.parse(videoUrl);

    if (!supportedDomains.any((domain) => uri.host.contains(domain))) {
      throw ArgumentError('Unsupported website');
    }

    final api = API(client: _client, dataUrl: videoUrl);
    final apiResponse = await api.convert();

    source = apiResponse['source'] as String? ?? '';
    title = apiResponse['title'] as String? ?? '';
    duration = apiResponse['duration'] as String? ?? '';
    thumbnail = apiResponse['thumbnail'] as String? ?? '';
    website = apiResponse['website'] as String;
    data =
        List<Map<String, dynamic>>.from(apiResponse['data'] as List<dynamic>);
    _client.close();

    return {
      'source': source,
      'title': title,
      'duration': duration,
      'thumbnail': thumbnail,
      'website': website,
      'data': data,
    };
  }
}
