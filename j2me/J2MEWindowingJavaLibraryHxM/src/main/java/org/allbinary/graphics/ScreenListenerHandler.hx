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
package org.allbinary.graphics;


class ScreenListenerHandler {
    private static final instance : ScreenListenerHandler = new ScreenListenerHandler();
    public static function getInstance() : ScreenListenerHandler {
        return ScreenListenerHandler.instance;
    }

    private var screenListenerInterface : ScreenListenerInterface = new ScreenEmptyListener();
    public function setListener(screenListenerInterface : ScreenListenerInterface) : Void {
        this.screenListenerInterface = screenListenerInterface;
    }

    public function fireWithState(isFullScreen : Bool) : Void {
        this.screenListenerInterface.onFullScreen(isFullScreen);
    }

    public function fire() : Void {
        this.screenListenerInterface.onFullScreenDisplay();
    }

    public function new() {
    }
}

