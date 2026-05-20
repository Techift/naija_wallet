import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

val releaseKeystorePath = System.getenv("ANDROID_KEYSTORE_PATH") ?: keystoreProperties["storeFile"] as String?
val releaseKeyAlias = System.getenv("ANDROID_KEYSTORE_ALIAS") ?: keystoreProperties["keyAlias"] as String?
val releaseKeyPassword = System.getenv("ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD") ?: keystoreProperties["keyPassword"] as String?
val releaseStorePassword = System.getenv("ANDROID_KEYSTORE_PASSWORD") ?: keystoreProperties["storePassword"] as String?

android {
    namespace = "com.example.verygoodcore.naija_wallet"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.verygoodcore.naija_wallet"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            releaseKeystorePath?.let { storeFile = file(it) }
            keyAlias = releaseKeyAlias
            keyPassword = releaseKeyPassword
            storePassword = releaseStorePassword
        }
    }

    flavorDimensions += "default"
    productFlavors {
        create("production") {
            dimension = "default"
            applicationIdSuffix = ""
            manifestPlaceholders["appName"] = "Naija Wallet"
        }
        create("staging") {
            dimension = "default"
            applicationIdSuffix = ".stg"
            manifestPlaceholders["appName"] = "[STG] Naija Wallet"
        }
        create("development") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            manifestPlaceholders["appName"] = "[DEV] Naija Wallet"
        }
    }

    buildTypes {
        getByName("release") {
            if (releaseKeystorePath != null) {
                signingConfig = signingConfigs.getByName("release")
            }
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android.txt"),
                "proguard-rules.pro"
            )
        }
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib:2.2.10")
}
