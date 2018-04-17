package com.yourcompany.test1;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.flyou.test/android";
    private static final String NET_CHANGE_CHANNEL = "com.flyou.test/netChanged";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        System.out.println(call.method);
                        if (call.method.equals("showToast")) {
                            if (call.hasArgument("msg") && !TextUtils.isEmpty(call.argument("msg").toString())) {
                                Toast.makeText(MainActivity.this, call.argument("msg").toString(), Toast.LENGTH_SHORT).show();
                            } else {
                                Toast.makeText(MainActivity.this, "toast text must not null", Toast.LENGTH_SHORT).show();
                            }
                        } else if (call.method.equals("netConnection")) {
                            boolean networkConnected = NetUtil.isNetworkConnected(getApplicationContext());
                            result.success(networkConnected);
                        } else if (call.method.equals("getAndroidText")) {
                            result.success("I am from Android platform");
                        }
                    }
                });

        new EventChannel(getFlutterView(), NET_CHANGE_CHANNEL).setStreamHandler(
                new EventChannel.StreamHandler() {
                    private BroadcastReceiver netStateChangeReceiver;

                    @Override
                    public void onListen(Object arguments, EventChannel.EventSink events) {

                        netStateChangeReceiver = createNetStateChangeReceiver(events);
                        registerReceiver(netStateChangeReceiver, new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION));
                    }

                    @Override
                    public void onCancel(Object arguments) {
                        unregisterReceiver(netStateChangeReceiver);
                        netStateChangeReceiver = null;
                    }
                }
        );
    }


    private BroadcastReceiver createNetStateChangeReceiver(final EventChannel.EventSink events) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
                NetworkInfo mobNetInfo = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);
                NetworkInfo wifiNetInfo = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);

                if (!mobNetInfo.isConnected() && !wifiNetInfo.isConnected()) {
                    Log.i("通知", "网络不可以用");
                    events.success("网络不可以用");
                } else if (mobNetInfo.isConnected()) {
                    Log.i("通知", "仅移动网络可用");
                    events.success("仅移动网络可用");
                } else if (wifiNetInfo.isConnected()) {
                    Log.i("通知", "Wifi网络可用");
                    events.success("Wifi网络可用");
                }
            }
        };
    }
}
