// Generated Code Do Not Modify
package org.allbinary.game.input;

//import javax.microedition.lcdui.Canvas;
import android.view.KeyEvent;

class AndroidNumberKeyToJ2MECanvasNumberKey {
    private static final androidtoJavaMicroEditionKeyMap : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...17) 0]);
    public static function init() : Void {
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_0] = Canvas.KEY_NUM0;
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_1] = Canvas.KEY_NUM1;
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_2] = Canvas.KEY_NUM2;
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_3] = Canvas.KEY_NUM3;
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_4] = Canvas.KEY_NUM4;
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_5] = Canvas.KEY_NUM5;
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_6] = Canvas.KEY_NUM6;
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_7] = Canvas.KEY_NUM7;
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_8] = Canvas.KEY_NUM8;
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_9] = Canvas.KEY_NUM9;
    }

    public function new() {
    }

    public static function getKey(key : Int) : Int {
        if (key < AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap.length) {
            var value : Int = AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[key];
            if (value != 0) {
                return value;
            }
        }
        return key;
    }

}

