// Generated Code Do Not Modify
package org.allbinary.game.input;

import android.view.KeyEvent;
import org.allbinary.android.ActivityFractureUtil;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;

class AndroidKeyFactory extends ActivityFractureUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final UNKNOWN : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_UNKNOWN, "UNKNOWN");
    public var KEYCODE_BUTTON_L1 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_R1 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_THUMBR : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_THUMBL : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_START : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_MODE : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_B : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_A : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_X : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_Y : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_L2 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_R2 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_SELECT : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_C : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_Z : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_1 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_10 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_11 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_12 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_13 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_14 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_15 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_16 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_2 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_3 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_4 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_5 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_6 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_7 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_8 : AndroidGameKey = this.UNKNOWN;
    public var KEYCODE_BUTTON_9 : AndroidGameKey = this.UNKNOWN;
    public final SOFT_LEFT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_SOFT_LEFT, "SOFT_LEFT");
    public final SOFT_RIGHT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_SOFT_RIGHT, "SOFT_RIGHT");
    public final HOME : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_HOME, "HOME");
    public final BACK : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_BACK, "BACK");
    public final CALL : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_CALL, "CALL");
    public final ENDCALL : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_ENDCALL, "ENDCALL");
    public final ZERO : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_0, CommonPhoneStrings.getInstance().ZERO);
    public final ONE : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_1, CommonPhoneStrings.getInstance().ONE);
    public final TWO : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_2, CommonPhoneStrings.getInstance().TWO);
    public final THREE : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_3, CommonPhoneStrings.getInstance().THREE);
    public final FOUR : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_4, CommonPhoneStrings.getInstance().FOUR);
    public final FIVE : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_5, CommonPhoneStrings.getInstance().FIVE);
    public final SIX : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_6, CommonPhoneStrings.getInstance().SIX);
    public final SEVEN : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_7, CommonPhoneStrings.getInstance().SEVEN);
    public final EIGHT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_8, CommonPhoneStrings.getInstance().EIGHT);
    public final NINE : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_9, CommonPhoneStrings.getInstance().NINE);
    public final STAR : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_STAR, CommonPhoneStrings.getInstance().STAR);
    public final POUND : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_POUND, CommonPhoneStrings.getInstance().POUND);
    public final DPAD_UP : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_DPAD_UP, "UP");
    public final DPAD_DOWN : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_DPAD_DOWN, "DOWN");
    public final DPAD_LEFT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_DPAD_LEFT, "LEFT");
    public final DPAD_RIGHT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_DPAD_RIGHT, "RIGHT");
    public final DPAD_CENTER : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_DPAD_CENTER, "CENTER");
    public final VOLUME_UP : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_VOLUME_UP, "VOLUME_UP");
    public final VOLUME_DOWN : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_VOLUME_DOWN, "VOLUME_DOWN");
    public final POWER : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_POWER, "POWER");
    public final CAMERA : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_CAMERA, "CAMERA");
    public final CLEAR : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_CLEAR, "CLEAR");
    public final A : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_A, "A");
    public final B : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_B, "B");
    public final C : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_C, "C");
    public final D : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_D, "D");
    public final E : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_E, "E");
    public final F : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_F, "F");
    public final G : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_G, "G");
    public final H : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_H, "H");
    public final I : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_I, "I");
    public final J : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_J, "J");
    public final K : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_K, "K");
    public final L : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_L, "L");
    public final M : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_M, "M");
    public final N : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_N, "N");
    public final O : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_O, "O");
    public final P : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_P, "P");
    public final Q : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_Q, "Q");
    public final R : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_R, "R");
    public final S : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_S, "S");
    public final T : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_T, "T");
    public final U : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_U, "U");
    public final V : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_V, "V");
    public final W : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_W, "W");
    public final X : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_X, "X");
    public final Y : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_Y, "Y");
    public final Z : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_Z, "Z");
    public final COMMA : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_COMMA, "COMMA");
    public final PERIOD : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_PERIOD, AbPathData.getInstance().EXTENSION_SEP);
    public final ALT_LEFT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_ALT_LEFT, "ALT_LEFT");
    public final ALT_RIGHT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_ALT_RIGHT, "ALT_RIGHT");
    public final SHIFT_LEFT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_SHIFT_LEFT, "SHIFT_LEFT");
    public final SHIFT_RIGHT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_SHIFT_RIGHT, "SHIFT_RIGHT");
    public final TAB : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_TAB, "TAB");
    public final SPACE : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_SPACE, "SPACE");
    public final SYM : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_SYM, "SYM");
    public final EXPLORER : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_EXPLORER, "EXPLORER");
    public final ENVELOPE : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_ENVELOPE, "ENVELOPE");
    public final ENTER : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_ENTER, "ENTER");
    public final DEL : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_DEL, "DEL");
    public final GRAVE : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_GRAVE, "GRAVE");
    public final MINUS : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_MINUS, "MINUS");
    public final EQUALS : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_EQUALS, "EQUALS");
    public final LEFT_BRACKET : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_LEFT_BRACKET, "LEFT_BRACKET");
    public final RIGHT_BRACKET : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_RIGHT_BRACKET, "RIGHT_BRACKET");
    public final BACKSLASH : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_BACKSLASH, "BACKSLASH");
    public final SEMICOLON : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_SEMICOLON, "SEMICOLON");
    public final APOSTROPHE : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_APOSTROPHE, "APOSTROPHE");
    public final SLASH : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_SLASH, "SLASH");
    public final AT : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_AT, "AT");
    public final NUM : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_NUM, "NUM");
    public final HEADSETHOOK : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_HEADSETHOOK, "HEADSETHOOK");
    public final FOCUS : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_FOCUS, "FOCUS");
    public final PLUS : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_PLUS, "PLUS");
    public final MENU : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_MENU, "MENU");
    public final NOTIFICATION : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_NOTIFICATION, "NOTIFICATION");
    public final SEARCH : AndroidGameKey = new AndroidGameKey(KeyEvent.KEYCODE_SEARCH, "SEARCH");
    public function init() : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF("Start/End", this, commonStrings.INIT);
    }

    public function isSubmission(input : Input) : Bool {
        if (input == this.ENTER) {
            return true;
        } else if (input == this.DPAD_CENTER) {
            return true;
        }
        return false;
    }

    public function isDelete(input : Input) : Bool {
        return false;
    }

    public function isBackSpace(input : Input) : Bool {
        if (input == this.DEL) {
            return true;
        }
        return false;
    }

    public function isLeft(input : Input) : Bool {
        if (input == this.DPAD_LEFT) {
            return true;
        }
        return false;
    }

    public function isRight(input : Input) : Bool {
        if (input == this.DPAD_RIGHT) {
            return true;
        }
        return false;
    }

    public function isUp(input : Input) : Bool {
        if (input == this.DPAD_UP) {
            return true;
        }
        return false;
    }

    public function isDown(input : Input) : Bool {
        if (input == this.DPAD_DOWN) {
            return true;
        }
        return false;
    }

    public function isEnter(input : Input) : Bool {
        if (input == this.DPAD_CENTER) {
            return true;
        } else if (input == this.ENTER) {
            return true;
        } else if (input == this.CALL) {
            return true;
        }
        return false;
    }

    public function new() {
        super();
    }
}

