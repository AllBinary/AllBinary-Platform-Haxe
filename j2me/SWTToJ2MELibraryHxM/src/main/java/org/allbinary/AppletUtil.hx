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
package org.allbinary;


//import org.allbinary.logic.communication.log.PreLogUtil;
class AppletUtil {
    public function new() {
    }

    private static var applet : Bool = false;
    public static function setApplet() : Void {
        AppletUtil.applet = true;
    }

    public static function isAppletLoader(anyType : Any) : Bool {
        return AppletUtil.applet;
    }

}

