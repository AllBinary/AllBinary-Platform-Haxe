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
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.paint.InitUpdatePaintable;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class OverlayPaintable extends InitUpdatePaintable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        super();
    }

    public override function update_() : Void {
        try {
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.UPDATE, e);
        }
    }

    public override function paint(graphics : Graphics) : Void {
    }

}

