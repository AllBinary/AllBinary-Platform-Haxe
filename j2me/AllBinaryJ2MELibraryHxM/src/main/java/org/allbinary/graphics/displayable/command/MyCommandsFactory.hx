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
package org.allbinary.graphics.displayable.command;

import javax.microedition.lcdui.Command;
import org.allbinary.logic.string.StringUtil;

class MyCommandsFactory {
    private static final instance : MyCommandsFactory = new MyCommandsFactory();
    public static function getInstance() : MyCommandsFactory {
        return MyCommandsFactory.instance;
    }

    public final NO_COMMAND : Command = new Command(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, -1, -1);
    public final GAUGE_CHANGE : Command = new Command("GAUGE_CHANGE", StringUtil.getInstance().EMPTY_STRING, Command.ITEM, 1);
    public final SET_DISPLAYABLE : Command = new Command("Display", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2);
    public final PAUSE_COMMAND : Command = new Command("Pause", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 0);
    public final RESUME_COMMAND : Command = new Command("Resume", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 0);
    public function new() {
    }

}

