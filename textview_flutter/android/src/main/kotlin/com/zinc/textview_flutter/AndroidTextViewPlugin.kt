package com.zinc.textview_flutter

import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.service.ServiceAware
import io.flutter.embedding.engine.plugins.service.ServicePluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * @author: Jiang Pengyong
 * @date: 2021/9/21 2:02 下午
 * @email: 56002982@qq.com
 * @des: 平台插件注册
 * 插件需要实现 FlutterPlugin
 * 如果插件需要 Activity 引用, 需要实现 ActivityAware
 * 如果插件需要后台服务, 需要实现 ServiceAware
 */
class AndroidTextViewPlugin : FlutterPlugin,
    MethodChannel.MethodCallHandler,
    ActivityAware,
    ServiceAware {
    companion object {
        // V1 的注册逻辑，必须是静态的，名字为 registerWith
        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(
                registrar.messenger(),
                "platform_textview_plugin"
            )
            channel.setMethodCallHandler(AndroidTextViewPlugin())

            // 添加注册我们创建的 view ，注意这里的 withId 需要和 flutter 侧的值相同
            registrar.platformViewRegistry().registerViewFactory(
                "platform_text_view",
                AndroidPlatformViewFactory(registrar.messenger())
            )
        }
    }

    /**
     * 插件加入到 Flutter 的环境中
     */
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Log.e("Platform", "onAttachedToEngine: $binding")
        binding.platformViewRegistry.apply {
            registerViewFactory(
                "platform_text_view",
                AndroidPlatformViewFactory(binding.binaryMessenger)
            )
        }
    }

    /**
     * 插件剥离 Flutter 的环境
     */
    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Log.e("Platform", "onDetachedFromEngine: $binding")
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Log.e("Platform", "call method: ${call.method}")
    }

    // 插件附加到 Activity
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        Log.e("Platform", "onAttachedToActivity: $binding")
    }

    // 插件附加到的 Activity 被销毁以更改配置
    // 此调用之后将是 onReattachedToActivityForConfigChanges()。
    override fun onDetachedFromActivityForConfigChanges() {
        Log.e("Platform", "onDetachedFromActivityForConfigChanges")
    }

    // 在配置更改后，插件重新加入，已附加到新 Activity
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        Log.e("Platform", "onReattachedToActivityForConfigChanges: $binding")
    }

    // 插件不再与 Activity 相关联，清理引用
    override fun onDetachedFromActivity() {
        Log.e("Platform", "onDetachedFromActivity")
    }

    override fun onAttachedToService(binding: ServicePluginBinding) {
        Log.e("Platform", "onAttachedToService: $binding")
    }

    override fun onDetachedFromService() {
        Log.e("Platform", "onDetachedFromService")
    }
}