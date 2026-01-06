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
