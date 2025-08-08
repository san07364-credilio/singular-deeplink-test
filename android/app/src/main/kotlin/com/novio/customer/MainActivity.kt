package com.novio.customer

import android.content.Intent
import com.singular.flutter_sdk.SingularBridge
import io.flutter.embedding.android.FlutterActivity
//import co.ab180.airbridge.flutter.AirbridgeFlutter


class MainActivity: FlutterActivity() {
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        if (intent.data != null) {
            SingularBridge.onNewIntent(intent)
        }
    }
}
