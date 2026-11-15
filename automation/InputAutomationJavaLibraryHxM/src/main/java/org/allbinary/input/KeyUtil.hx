/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.input;

//import java.awt.event.KeyEvent;

class KeyUtil {
    public function new() {
    }

    public static function isNormallyDisplayed(keyCode : Int) : Bool {
        switch (keyCode) {
            case switchValue if (switchValue == KeyEvent.VK_SPACE || switchValue == KeyEvent.VK_COMMA || switchValue == KeyEvent.VK_MINUS || switchValue == KeyEvent.VK_PERIOD || switchValue == KeyEvent.VK_SLASH || switchValue == KeyEvent.VK_0 || switchValue == KeyEvent.VK_1 || switchValue == KeyEvent.VK_2 || switchValue == KeyEvent.VK_3 || switchValue == KeyEvent.VK_4 || switchValue == KeyEvent.VK_5 || switchValue == KeyEvent.VK_6 || switchValue == KeyEvent.VK_7 || switchValue == KeyEvent.VK_8 || switchValue == KeyEvent.VK_9 || switchValue == KeyEvent.VK_SEMICOLON || switchValue == KeyEvent.VK_EQUALS || switchValue == KeyEvent.VK_A || switchValue == KeyEvent.VK_B || switchValue == KeyEvent.VK_C || switchValue == KeyEvent.VK_D || switchValue == KeyEvent.VK_E || switchValue == KeyEvent.VK_F || switchValue == KeyEvent.VK_G || switchValue == KeyEvent.VK_H || switchValue == KeyEvent.VK_I || switchValue == KeyEvent.VK_J || switchValue == KeyEvent.VK_K || switchValue == KeyEvent.VK_L || switchValue == KeyEvent.VK_M || switchValue == KeyEvent.VK_N || switchValue == KeyEvent.VK_O || switchValue == KeyEvent.VK_P || switchValue == KeyEvent.VK_Q || switchValue == KeyEvent.VK_R || switchValue == KeyEvent.VK_S || switchValue == KeyEvent.VK_T || switchValue == KeyEvent.VK_U || switchValue == KeyEvent.VK_V || switchValue == KeyEvent.VK_W || switchValue == KeyEvent.VK_X || switchValue == KeyEvent.VK_Y || switchValue == KeyEvent.VK_Z || switchValue == KeyEvent.VK_OPEN_BRACKET || switchValue == KeyEvent.VK_BACK_SLASH || switchValue == KeyEvent.VK_CLOSE_BRACKET || switchValue == KeyEvent.VK_NUMPAD0 || switchValue == KeyEvent.VK_NUMPAD1 || switchValue == KeyEvent.VK_NUMPAD2 || switchValue == KeyEvent.VK_NUMPAD3 || switchValue == KeyEvent.VK_NUMPAD4 || switchValue == KeyEvent.VK_NUMPAD5 || switchValue == KeyEvent.VK_NUMPAD6 || switchValue == KeyEvent.VK_NUMPAD7 || switchValue == KeyEvent.VK_NUMPAD8 || switchValue == KeyEvent.VK_NUMPAD9 || switchValue == KeyEvent.VK_MULTIPLY || switchValue == KeyEvent.VK_ADD || switchValue == KeyEvent.VK_SEPARATER || switchValue == KeyEvent.VK_SUBTRACT || switchValue == KeyEvent.VK_DECIMAL || switchValue == KeyEvent.VK_DIVIDE):
                return true;
            default:
                return false;
        }
    }

}

