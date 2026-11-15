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
package org.allbinary.graphics.paint;

//import javax.microedition.lcdui.Graphics;

class PaintableComposite extends Paintable {
    private var paintableArray : haxe.ds.Vector<PaintableInterface>;
    public function new(paintableArray : haxe.ds.Vector<PaintableInterface>) {
        super();
        this.paintableArray = paintableArray;
    }

    public override function paint(graphics : Graphics) : Void {
        {
            var index : Int = this.paintableArray.length - 1;
            while (index >= 0) {
            this.paintableArray[index].paint(graphics);
                index--;
            }
        }
    }

    public override function paintThreed(graphics : Graphics) : Void {
        {
            var index : Int = this.paintableArray.length - 1;
            while (index >= 0) {
            this.paintableArray[index].paintThreed(graphics);
                index--;
            }
        }
    }

}

