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
package org.allbinary.content;

//import javax.microedition.lcdui.Command;
import org.allbinary.logic.communication.log.LogUtil;

class CommandUriAction {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : CommandUriAction = new CommandUriAction();
    public static function getInstance() : CommandUriAction {
        return CommandUriAction.instance;
    }

    public function add(command : Command, url : String) : Void {
    }

    public function process(command : Command) : Void {
    }

    public function new() {
    }
}

