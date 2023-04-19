# Savely
![Image](https://i.imgur.com/aH6lKHM.png)

###### Savely is a versatile Dart and Flutter package for working with various video-sharing platforms. With Savely, you can easily download and  retrieve the duration and type of a video, get the direct link of its thumbnail, and perform other operations, regardless of the platform. Currently, Savely supports popular websites like YouTube, TikTok ...
###### Savely is designed to be easy to use, with a simple API that allows you to perform these operations with just a few lines of code. To get started, simply pass the URL of the video you want to work with. You can retrieve this URL from the Share button of the video on your preferred platform.
###### With Savely, you can be confident that your video operations will work smoothly and reliably, no matter which platform you are working with. Try Savely today and take the hassle out of working with videos on different websites!
## Features
- ##### Multi Qualities
- ##### Get Duration and Type of The Video
- ##### Get Direct link of Thumbnail
- ##### Work on both Dart and Flutter app

## Supported Websites
- ##### Youtube
- ##### Tiktok
- ##### Facebook
- ##### Twitter
- ##### Reddit
- ##### Dailymotion
- ##### Instagram
- ##### Soundcloud
- ##### Vimeo
- ##### OK-ru
- ##### VK


## How it work !
- ##### Put the Url of The Video you can get it from Share button


## Installation

##### First Import The Package :
```dart
import 'package:savely/savely.dart';
```

##### Then init the Savely class:
```dart
    final Savely savely = Savely();
```

##### Call the Download function (it`s future ) and Get the data:
```dart
void main() async {
    final Savely savely = Savely();
    await savely.down('https://www.youtube.com/watch?v=J_hQpNWA-Z8');
    if (kDebugMode) {
      print('source : ${savely.source}');
      print('title : ${savely.title}');
      print('duration : ${savely.duration}');
      print('thumbnail : ${savely.thumbnail}');
      print('website : ${savely.website}');
      print('data : ${savely.data}');
    }
}
```
## License
```license
BSD 3-Clause License

Copyright (c) 2023 Djeddi Yacine
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```