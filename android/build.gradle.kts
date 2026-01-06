allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    // REMOVED: evaluationDependsOn(":app") - This usually causes the circular error
}

subprojects {
    // Use the 'android' extension directly within the subproject block
    // without wrapping it in afterEvaluate if possible, or use a safer hook.
    if (project.extensions.findByName("android") != null) {
        configure<com.android.build.gradle.BaseExtension> {
            // Force all plugins to compile against SDK 34
            compileSdkVersion(34)

            // Optional: Ensure they also use a compatible NDK version if needed
            ndkVersion = "27.0.12077973"
        }
    }
    plugins.withType<com.android.build.gradle.api.AndroidBasePlugin> {
        configure<com.android.build.gradle.BaseExtension> {
            if (namespace == null) {
                namespace = project.group.toString()
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
