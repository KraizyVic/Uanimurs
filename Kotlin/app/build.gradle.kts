plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.kotlin.compose)
    alias(libs.plugins.kotlin.serialization)
    id("com.google.devtools.ksp")
}

android {
    namespace = "com.example.uanimurs"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.example.uanimurs"
        minSdk = 24
        targetSdk = 36
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    kotlinOptions {
        jvmTarget = "11"
    }
    buildFeatures {
        compose = true
    }
}

dependencies {

    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.lifecycle.runtime.ktx)
    implementation(libs.androidx.activity.compose)
    implementation(platform(libs.androidx.compose.bom))
    implementation(libs.androidx.ui)
    implementation(libs.androidx.ui.graphics)
    implementation(libs.androidx.ui.tooling.preview)
    implementation(libs.androidx.material3)

    // --- COIL ---
    implementation(libs.coil.compose) // or via `libs.coil.compose`
    // --- Ktor HTTP Client ---
    implementation(libs.ktor.client.core) // Core Ktor client APIs
    implementation(libs.ktor.client.cio) // CIO engine (lightweight and async-friendly)
    implementation(libs.ktor.client.content.negotiation) // Content negotiation support (like JSON)
    implementation(libs.ktor.serialization.kotlinx.json) // JSON serializer using kotlinx.serialization
    // -- Navigation --
    implementation(libs.androidx.navigation.compose) // Jetpack Navigation for Compose
    // --- Kotlin Coroutines for ViewModelScope and Flow operators ---
    implementation(libs.kotlinx.coroutines.android) // Or the latest stable version
    implementation(libs.kotlinx.coroutines.core) // Or the latest stable version
    // --- Koin DI ---
    implementation(libs.koin.core) // Core DI engine for Kotlin
    implementation(libs.koin.android) // Android-specific features like lifecycle-aware scopes
    implementation(libs.koin.androidx.compose) // Compose-specific APIs like `getViewModel()` and `inject()`
    // --- Room Database ---
    implementation(libs.androidx.room.runtime)    //Room's core runtime functionality
    implementation(libs.androidx.room.ktx)    //Kotlin extensions: coroutines + Flow support
    ksp(libs.androidx.room.compiler)    // Annotation processor for DAOs and entities (use KSP!)
    // --- Icons ---
    implementation(libs.androidx.material.icons.core)
    implementation(libs.androidx.material.icons.extended)

    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)
    androidTestImplementation(platform(libs.androidx.compose.bom))
    androidTestImplementation(libs.androidx.ui.test.junit4)
    debugImplementation(libs.androidx.ui.tooling)
    debugImplementation(libs.androidx.ui.test.manifest)
}