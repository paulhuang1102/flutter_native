package com.example.channel;

import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import com.example.channel.Pigeon.*;
import java.util.Collections;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "flutter.native/helper";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        SearchApi.setup(flutterEngine.getDartExecutor().getBinaryMessenger(), new MyApi());

        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler(
            (call, result) -> {
                // Note: this method is invoked on the main thread.
                if (call.method.equals("helloFromNativeCode")) {
                    String greetings = helloFromNativeCode();
                    result.success(greetings);
                }
            });
    }

   
    private String helloFromNativeCode() {
        return "Hello from Native Android Code";
    }

    private class MyApi implements SearchApi {

        @java.lang.Override
        public SearchReply search(SearchRequest request) {
           SearchReply reply = new SearchReply();

           if (request.getQuery() == RequsetType.sayhello) {
               reply.setResult("Hello");
           }

           if (request.getQuery() == RequsetType.getbattery) {
               IntentFilter ifilter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
               Intent batteryStatus = getContext().registerReceiver(null, ifilter);
               int level = batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);

               float batteryPct = level;

               reply.setResult(String.valueOf(batteryPct));

           }

           return reply;
        }
    }
}
