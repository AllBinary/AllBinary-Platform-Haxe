// Generated Code Do Not Modify
package org.allbinary.android;

import android.content.Context;
import android.view.View;
import android.widget.Toast;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ToastUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ToastUtil = new ToastUtil();
    public static function getInstance() : ToastUtil {
        return ToastUtil.instance;
    }

    public function makeToast(view : View, context : Context, message : String, time : Int) : Void {
        // Java inner class: Haxe does not nest classes so move this to its own module
        class MakeToast implements Runnable {
            public final string : String;
            public function new(string : String) {
                this.string = string;
            }

            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                try {
                    Toast.makeText(context, this.string, time).show();
                } catch (e : haxe.Exception) {
                    final commonStrings : CommonStrings = CommonStrings.getInstance();
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

        }
        view.post(new MakeToast(message));
    }

    public function new() {
    }
}

