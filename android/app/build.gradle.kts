plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services") version "4.4.3"            // ← فعّلنا هنا
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.medi_link"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.example.medi_link"
        minSdk = flutter.minSdkVersion
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:34.0.0"))

    // Firebase modules
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")    // ← للتوثيق
    implementation("com.google.firebase:firebase-firestore")// لو هتستخدم Firestore
}

flutter {
    source = "../.."
}
