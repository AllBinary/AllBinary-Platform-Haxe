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

import org.allbinary.logic.communication.log.LogUtil;

class StatusFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : StatusFactory = new StatusFactory();
    public static function getInstance() : StatusFactory {
        return StatusFactory.instance;
    }

    private final SETSTATUS : String = "setStatus";
    private final STATUS_LABEL : String = "Status: ";
    public function setStatusNoLog(status : String) : Void {
        MyFrame.statusJLabel.setText(status);
    }

    public function setStatus(status : String) : Void {
        this.setStatusNoLog(status);
        this.logUtil.putF(this.STATUS_LABEL + status, this, this.SETSTATUS);
    }

    public function new() {
    }
}

