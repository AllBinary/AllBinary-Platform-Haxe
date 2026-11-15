/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.graphics.displayable.screen;

//import javax.microedition.lcdui.Canvas;
//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;

class AboutCommandProcessor {
    private static final instance : AboutCommandProcessor = new AboutCommandProcessor();
    public static function getInstance() : AboutCommandProcessor {
        return AboutCommandProcessor.instance;
    }

    public function process(midletCommandListener : CommandListener, command : Command, canvas : Canvas) : Void {
        midletCommandListener.commandAction(command, canvas);
    }

    public function new() {
    }
}

