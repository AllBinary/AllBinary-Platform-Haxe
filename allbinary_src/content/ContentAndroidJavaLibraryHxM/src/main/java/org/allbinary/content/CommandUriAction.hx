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

import javax.microedition.lcdui.Command;
import android.content.Intent;
import android.net.Uri;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;

class CommandUriAction {
    public final logUtil : LogUtil = LogUtil.getInstance();
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
            var intent : Intent = this.getIntent(command);
            ResourceUtil.getInstance().getContext().startActivity(intent);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
        }
    }

    public function getIntent(command : Command) : Intent {
        var url : String = (cast this.hashtable.get(command) : String);
        var uri : Uri = Uri.parse(url);
        var intent : Intent = new Intent(Intent.ACTION_VIEW, uri);
        return intent;
    }

    public function new() {
    }
}

