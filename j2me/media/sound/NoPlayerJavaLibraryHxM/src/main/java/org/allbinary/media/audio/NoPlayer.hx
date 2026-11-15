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
package org.allbinary.media.audio;

import javax.microedition.media.Control;
import org.allbinary.logic.string.StringUtil;

class NoPlayer extends BasicPlayer {
    public static final NO_PLAYER : NoPlayer = new NoPlayer();
    public function new() {
        super();
    }

    public override function close() : Void {
    }

    public override function getContentType() : String {
        return StringUtil.getInstance().NULL_STRING;
    }

    public override function getControl(controlType : String) : Control {
        return new NullControl();
    }

    public override function getControls() : haxe.ds.Vector<Control> {
        return haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    }

}

