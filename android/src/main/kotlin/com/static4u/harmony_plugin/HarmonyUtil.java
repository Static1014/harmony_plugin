package android.src.main.kotlin.com.static4u.harmony_plugin;

import android.annotation.SuppressLint;
import android.content.Context;
import android.provider.Settings;
import android.text.TextUtils;

import java.lang.reflect.Method;

/**
 * 获取鸿蒙系统信息
 */
public class HarmonyUtil {
    /**
     * 是否为鸿蒙系统
     *
     * @return true为鸿蒙系统
     */
    public static boolean isHarmonyOs() {
        try {
            Class<?> buildExClass = Class.forName("com.huawei.system.BuildEx");
            Object osBrand = buildExClass.getMethod("getOsBrand").invoke(buildExClass);
            if (osBrand == null) {
                return false;
            }
            boolean isHarmony = "Harmony".equalsIgnoreCase(osBrand.toString());
            NSLog.i("当前设备是鸿蒙系统");
            return isHarmony;
        } catch (Exception e) {
            NSLog.printException(e);
            return false;
        }
    }

    /**
     * 获取鸿蒙系统版本号
     *
     * @return 版本号
     */
    public static String getHarmonyVersion() {
        return getProp("hw_sc.build.platform.version", "");
    }

    @SuppressLint("PrivateApi")
    private static String getProp(String property, String defaultValue) {
        try {
            Class<?> spClz = Class.forName("android.os.SystemProperties");
            Method method = spClz.getDeclaredMethod("get", String.class);
            String value = (String) method.invoke(spClz, property);
            if (TextUtils.isEmpty(value)) {
                return defaultValue;
            }
            NSLog.i("当前设备是鸿蒙" + value + "系统");
            return value;
        } catch (Exception e) {
            NSLog.printException(e);
        }
        return defaultValue;
    }

    /**
     * 判断是否开启鸿蒙纯净模式
     */
    public static boolean isPureMode(Context context) {
        boolean result = false;
        if (!isHarmonyOs()) {
            return false;
        }
        try {
            if (context != null) {
                result = 0 == Settings.Secure.getInt(context.getContentResolver(), "pure_mode_state", 0);
            }
        } catch (Exception e) {
            NSLog.printException(e);
        }
        return result;
    }
}
