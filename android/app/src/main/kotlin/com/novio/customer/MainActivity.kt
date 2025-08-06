package com.novio.customer

import android.content.Intent
import com.singular.flutter_sdk.SingularBridge
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        if (intent.data != null) {
            setIntent(intent)
            SingularBridge.onNewIntent(intent)
        }
    }
}
