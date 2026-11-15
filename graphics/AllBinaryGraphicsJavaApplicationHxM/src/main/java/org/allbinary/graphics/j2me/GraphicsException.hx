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
package org.allbinary.graphics.j2me;

import org.allbinary.logic.communication.log.GuiLog;
import org.allbinary.logic.communication.log.LogUtil;

class GraphicsException extends haxe.Exception {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final guiLog : GuiLog = GuiLog.getInstance();
    public function new(msg : String, obj : Any, method : String) {
        super(msg);
        try {
            this.guiLog.showDialog(msg);
            this.logUtil.put(msg, obj, method, this);
        } catch (e : haxe.Exception) {
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(msg : String, className : String, method : String) {
        super(msg);
        try {
            this.guiLog.showDialog(msg);
            this.logUtil.put(msg, className, method, this);
        } catch (e : haxe.Exception) {
        }
    }

}

