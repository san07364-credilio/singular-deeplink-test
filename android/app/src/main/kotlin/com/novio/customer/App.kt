package com.novio.customer

import io.flutter.app.FlutterApplication
//import co.ab180.airbridge.flutter.AirbridgeFlutter
import io.github.cdimascio.dotenv.dotenv

class MainApplication : FlutterApplication() {
    override fun onCreate() {
//        val dotenv = dotenv {
//            directory = "./assets"
//            filename = "env"
//        }
        super.onCreate()
//        AirbridgeFlutter.initializeSDK(this, dotenv["AIRBRIDGE_APP_NAME"], dotenv["AIRBRIDGE_SECRET"])
    }
}