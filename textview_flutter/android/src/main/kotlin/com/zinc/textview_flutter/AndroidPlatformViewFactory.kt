package com.zinc.textview_flutter

import android.content.Context
import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/**
 * @author: Jiang Pengyong
 * @date: 2021/9/21 2:20 下午
 * @email: 56002982@qq.com
 * @des: Platform View 创建
 */
class AndroidPlatformViewFactory(
    private val messenger: BinaryMessenger
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        Log.e("Platform", "AndroidPlatformViewFactory: $id")
        //  参数
        val params = args as? Map<String, Any>
        return AndroidTextView(context, messenger, id,  params)
    }
}
