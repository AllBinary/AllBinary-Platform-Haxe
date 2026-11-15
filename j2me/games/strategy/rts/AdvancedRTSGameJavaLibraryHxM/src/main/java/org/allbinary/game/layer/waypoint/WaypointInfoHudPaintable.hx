/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer.waypoint;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.NullPathFindingLayer;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.SelectionHudPaintable;
import org.allbinary.graphics.draw.KeyValueDrawString;

class WaypointInfoHudPaintable extends SelectionHudPaintable {
    private final keyvalueDrawString : KeyValueDrawString;
    public var rtsLayerP : PathFindingLayerInterface = NullPathFindingLayer.NULL_PATH_FINDING_LAYER;
    private var textLine2Y : Int = 0;
    public function new() {
        super();
        this.keyvalueDrawString = new KeyValueDrawString("Owner: ", this.textX);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        super.updateMeasurement(graphics);
        final font : Font = graphics.getFont();
        this.textLine2Y = (this.y + font.getHeight());
    }

    public override function updateSelectionInfo() : Void {
        final rtsLayer : RTSLayer = (cast this.rtsLayerP : RTSLayer);
        this.setName(rtsLayer.getName());
        this.setAnimationInterface(rtsLayer.getVerticleBuildAnimationInterface());
        this.keyvalueDrawString.update(rtsLayer.getParentLayer().getName());
    }

    public function setRtsLayer(rtsLayer : RTSLayer) : Void {
        this.rtsLayerP = rtsLayer;
    }

    public function getRtsLayer() : PathFindingLayerInterface {
        return this.rtsLayerP;
    }

    public override function paint(graphics : Graphics) : Void {
        super.paint(graphics);
        this.keyvalueDrawString.paint(graphics, this.textLine2Y);
        this.getAnimationInterface().paintXY(graphics, this.imageX, this.y);
    }

}

