/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.paint.InitUpdatePaintable;
import org.allbinary.graphics.paint.NullInitUpdatePaintable;

class RTSLayerInfoPaintable extends InitUpdatePaintable {
    private var initUpdatePaintable : InitUpdatePaintable = NullInitUpdatePaintable.getInstance();
    public function new() {
        super();
    }

    public override function update() : Void {
        this.initUpdatePaintable.update();
    }

    public override function paint(graphics : Graphics) : Void {
        this.initUpdatePaintable.paint(graphics);
    }

    public function updateRTSLayerInfoInit(hudPaintable : InitUpdatePaintable) : Void {
        this.initUpdatePaintable = hudPaintable;
    }

    public function updateRTSLayerInfoSelection(hudPaintable : SelectionHudPaintable) : Void {
        hudPaintable.updateSelectionInfo();
        this.initUpdatePaintable = hudPaintable;
    }

}

