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

//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.paint.ColorFillBasePaintable;
import org.allbinary.game.paint.ColorFillPaintableFactory;
import org.allbinary.graphics.paint.Paintable;

class BasicPaintablesCanvas extends GameCommandCanvas {
    private final paintableArray : haxe.ds.Vector<Paintable>;
    private final colorFillPaintable : ColorFillBasePaintable;
    public function new(cmdListener : CommandListener, name : String, allBinaryGameLayerManager : AllBinaryGameLayerManager, paintableArray : haxe.ds.Vector<Paintable>) {
        super(cmdListener, name, allBinaryGameLayerManager.getBackgroundBasicColor(), allBinaryGameLayerManager.getForegroundBasicColor());
        this.paintableArray = paintableArray;
        this.colorFillPaintable = ColorFillPaintableFactory.getInstance().getInstance(allBinaryGameLayerManager.getBackgroundBasicColor(), false);
    }

    public override function paint(graphics : Graphics) : Void {
        this.colorFillPaintable.paint(graphics);
        graphics.setColor(this.foregroundColor);
        {
            var index : Int = this.paintableArray.length - 1;
            while (index >= 0) {
            this.paintableArray[index].paint(graphics);
                index--;
            }
        }
        super.paint(graphics);
    }

}

