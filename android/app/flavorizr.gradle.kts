import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.prod.bkd"
            resValue(type = "string", name = "app_name", value = "Prod App")
        }
        create("stg") {
            dimension = "flavor-type"
            applicationId = "com.stg.bkd"
            resValue(type = "string", name = "app_name", value = "Stg App")
        }
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.dev.bkd"
            resValue(type = "string", name = "app_name", value = "Dev App")
        }
    }
}