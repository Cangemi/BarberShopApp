import 'dart:io' show Platform;

class Secret {
  static const ANDROID_CLIENT_ID = "AIzaSyBjwTZ9awZFvhuA-GCyvc7U0IjNa3TwsZM";
  static const IOS_CLIENT_ID = "AIzaSyBM8XyDddGrzj9vEsqQI9H4hAGu-oKxKEI";
  static String getId() =>
      Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}
