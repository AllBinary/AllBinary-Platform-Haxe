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
package org.allbinary.game.layer;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.layer.Layer;

class PaintableLayerComposite extends Paintable {
    private final paintableArray : haxe.ds.Vector<Layer>;
    public function new(paintableArray : haxe.ds.Vector<Layer>) {
        super();
        this.paintableArray = paintableArray;
    }

    public override function paint(graphics : Graphics) : Void {
        {
            var index : Int = this.paintableArray.length;
            while (--index >= 0) {
            this.paintableArray[index].paint(graphics);
            }
        }
    }

    public override function paintThreed(graphics : Graphics) : Void {
        var paintableInterface : PaintableInterface = null;
        {
            var index : Int = this.paintableArray.length;
            while (--index >= 0) {
            paintableInterface = (cast this.paintableArray[index] : PaintableInterface);
            paintableInterface.paintThreed(graphics);
            }
        }
    }

}

