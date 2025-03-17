buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:7.2.2") // ✅ Update to latest compatible version
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.5.31") // ✅ Correct Kotlin version
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Fix for Flutter's build directory
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
