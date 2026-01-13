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

# Isar giữ lại các lớp được generate
-keep class io.isar.** { *; }
-keep class * extends io.isar.IsarObject { *; }
-dontwarn io.isar.**

# Flutter Background Service
-keep class id.flutter.flutter_background_service.** { *; }

# Plugin Notification Listener (Plugin bạn đã clone)
-keep class im.zoe.labs.flutter_notification_listener.** { *; }

# Ngăn lỗi liên quan đến Kotlin coroutines thường gặp khi minify
-keepattributes Signature
-keepattributes *Annotation*
-keep class kotlin.coroutines.** { *; }
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.SplitInstallException
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManager
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManagerFactory
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest$Builder
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest
-dontwarn com.google.android.play.core.splitinstall.SplitInstallSessionState
-dontwarn com.google.android.play.core.splitinstall.SplitInstallStateUpdatedListener
-dontwarn com.google.android.play.core.tasks.OnFailureListener
-dontwarn com.google.android.play.core.tasks.OnSuccessListener
-dontwarn com.google.android.play.core.tasks.Task