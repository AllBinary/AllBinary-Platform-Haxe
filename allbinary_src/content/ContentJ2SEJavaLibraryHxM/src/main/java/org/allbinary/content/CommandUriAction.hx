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
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;

class CommandUriAction {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private static final instance : CommandUriAction = new CommandUriAction();
    public static function getInstance() : CommandUriAction {
        return CommandUriAction.instance;
    }

    private var hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public function add(command : Command, url : String) : Void {
        this.hashtable.put(command, url);
    }

    public function process(command : Command) : Void {
        try {
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
        }
    }

    public function getIntent(command : Command) : Intent {
        var url : String = (cast this.hashtable.get(command) : String);
        return intent;
    }

    public function new() {
    }
}

