# Flutter Background Service
-keep class id.flutter.flutter_background_service.** { *; }

# Flutter Notification Listener (corrected package)
-keep class im.zoe.labs.flutter_notification_listener.** { *; }

# Flutter JNI and Engine
-keep class io.flutter.embedding.engine.FlutterJNI { *; }
-keep class io.flutter.embedding.engine.loader.FlutterLoader { *; }
-keep class io.flutter.embedding.engine.dart.DartExecutor { *; }
-keep class io.flutter.view.FlutterCallbackInformation { *; }
-keep class io.flutter.view.FlutterMain { *; }
-keep class io.flutter.embedding.engine.plugins.** { *; }
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }

# Allow Flutter to find the entrypoint
-keepattributes Signature
-keepattributes *Annotation*
-keep class * extends io.flutter.plugin.common.MethodChannel$MethodCallHandler {
    <init>(...);
}
