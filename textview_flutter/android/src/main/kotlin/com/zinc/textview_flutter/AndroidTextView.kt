package com.zinc.textview_flutter

import android.content.Context
import android.graphics.Color
import android.view.Gravity
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

/**
 * @author: Jiang Pengyong
 * @date: 2021/9/21 1:43 下午
 * @email: 56002982@qq.com
 * @des: 创建原生 View
 */
class AndroidTextView(
    context: Context,
    messenger: BinaryMessenger,
    id: Int?,
    params: Map<String, Any>?
) : PlatformView, MethodChannel.MethodCallHandler {
    private var mAndroidTextView: TextView? = TextView(context)

    private var channel: MethodChannel? = null

    init {
        val text = params?.get("content") as CharSequence?
        mAndroidTextView?.let { textview ->
            textview.text = text ?: "Android Platform TextView"
            textview.textSize = 30f
            textview.setTextColor(Color.BLUE)
            textview.gravity = Gravity.CENTER
        }
        channel = MethodChannel(
            messenger,
            "textview_flutter/textview"
        ).apply {
            setMethodCallHandler(this@AndroidTextView)
        }
    }

    override fun getView(): View? = mAndroidTextView

    /**
     * 调用此方法后，PlatformView 对象将不可用。
     * 调用此方法后，实现 PlatformView 的插件必须清除对 View 对象和 PlatformView 的所有引用
     * 如果不这样做将导致内存泄漏
     * 与 onFlutterViewAttached(View) 中附加的 Android View 相关的引用必须在 dispose() 中释放以避免内存泄漏。
     */
    override fun dispose() {
        mAndroidTextView = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val method = call.method
        if (method == "changeContent") {
            val arg = call.arguments.toString()
            mAndroidTextView?.text = arg
        }
    }
}