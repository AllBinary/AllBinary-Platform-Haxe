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
package org.allbinary.game.input;

import org.allbinary.init.Init;
import org.allbinary.logic.communication.log.LogUtil;

class KeyFactoryInitializer extends Init {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public override function init() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.INIT);
    }

    public function new() {
        super();
    }
}

