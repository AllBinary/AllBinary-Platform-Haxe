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
package org.allbinary.game.layer.geological.resources;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.waypoint.WaypointInfoHudPaintable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.graphics.draw.KeyValueDrawCharArray;

class GeologicalResourceInfoHudPaintable extends WaypointInfoHudPaintable {
    private static final RESOURCES : String = "Resources: ";
    private final keyvalueDrawString : KeyValueDrawCharArray;
    private var fontHeight : Int = 0;
    public function new() {
        super();
        this.keyvalueDrawString = new KeyValueDrawCharArray(GeologicalResourceInfoHudPaintable.RESOURCES, this.textX);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        super.updateMeasurement(graphics);
        final font : Font = graphics.getFont();
        this.fontHeight = (2 * font.getHeight());
    }

    public override function updateSelectionInfo() : Void {
        super.updateSelectionInfo();
        final rtsLayer : RTSLayer = (cast this.rtsLayerP : RTSLayer);
        final list : BasicArrayList = rtsLayer.geographicMapCellPositionAreaBase.getOccupyingGeographicMapCellPositionList();
        var total : Int = 0;
        {
            var index : Int = list.size();
            while (--index >= 0) {
            var geographicMapCellPosition : GeologicalGeographicMapCellPosition = (cast list.get(index) : GeologicalGeographicMapCellPosition);
            total += geographicMapCellPosition.getGeologicalResource().getTotal();
            }
        }
        this.keyvalueDrawString.update(this.getPrimitiveLongUtil().getCharArray(total), this.getPrimitiveLongUtil().getCurrentTotalDigits());
    }

    public override function paint(graphics : Graphics) : Void {
        super.paint(graphics);
        this.keyvalueDrawString.paint(graphics, (this.y + this.fontHeight));
    }

}

