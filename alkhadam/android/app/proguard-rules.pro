# Flutter ProGuard Rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.provider.** { *; }

# Firebase Rules
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Google Maps Rules
-keep class com.google.android.gms.maps.** { *; }
-dontwarn com.google.android.gms.maps.**

# Keep annotated attributes & native methods
-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod
-keepclasseswithmembernames class * {
    native <methods>;
}
