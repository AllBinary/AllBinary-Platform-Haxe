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
package org.allbinary.canvas;

//import javax.microedition.lcdui.Canvas;
//import javax.microedition.lcdui.CommandListener;

class FullScreenUtil {
    private static final instance : FullScreenUtil = new FullScreenUtil();
    public static function getInstance() : FullScreenUtil {
        return FullScreenUtil.instance;
    }

    // throws Exception
    public function initOnRun(fullScreenInterface : Canvas, commandListener : CommandListener) : Void {
    }

    public function init(fullScreenInterface : Canvas) : Void {
    }

    public function isScreenChange(isFullScreen : Bool) : Bool {
        return false;
    }

    public function isScreenChangeCanvas(fullScreenInterface : Canvas) : Bool {
        return this.isScreenChange(fullScreenInterface.isFullScreenMode());
    }

    public function new() {
    }
}

