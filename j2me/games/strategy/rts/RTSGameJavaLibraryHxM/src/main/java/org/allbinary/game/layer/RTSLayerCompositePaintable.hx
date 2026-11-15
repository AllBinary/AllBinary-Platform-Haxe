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
import org.allbinary.logic.string.StringUtil;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.logic.string.StringMaker;

class RTSLayerCompositePaintable extends Paintable {
    private var upgradeCost : String = StringUtil.getInstance().EMPTY_STRING;
    private var downGradeCost : String = StringUtil.getInstance().EMPTY_STRING;
    private final UPGRADE : String = "Up: $";
    private final DOWNGRADE : String = "Down: $-";
    public final upgradableRTSLayerHudPaintable : UpgradableRTSLayerHudPaintable;
    public function new(upgradableRTSLayerHudPaintable : UpgradableRTSLayerHudPaintable) {
        super();
        this.upgradableRTSLayerHudPaintable = upgradableRTSLayerHudPaintable;
    }

    public function update(rtsLayer : RTSLayer) : Void {
        if (rtsLayer.isUpgradeable()) {
            this.setUpgradeCost(new StringMaker().append(this.UPGRADE).appendint(Std.int(rtsLayer.getUpgradeCost())).toString());
        } else {
            this.setUpgradeCost(StringUtil.getInstance().EMPTY_STRING);
        }
        if (rtsLayer.isDowngradeable()) {
            this.setDownGradeCost(new StringMaker().append(this.DOWNGRADE).appendint(Std.int(rtsLayer.getDowngradeCost())).toString());
        } else {
            this.setDownGradeCost(StringUtil.getInstance().EMPTY_STRING);
        }
    }

    public override function paint(graphics : Graphics) : Void {
        graphics.drawString(this.getDownGradeCost(), this.upgradableRTSLayerHudPaintable.textX, this.upgradableRTSLayerHudPaintable.costY1, 0);
        graphics.drawString(this.getUpgradeCost(), this.upgradableRTSLayerHudPaintable.textX, this.upgradableRTSLayerHudPaintable.costY, 0);
    }

    public function setUpgradeCost(upgradeCost : String) : Void {
        this.upgradeCost = upgradeCost;
    }

    public function getUpgradeCost() : String {
        return this.upgradeCost;
    }

    public function setDownGradeCost(downGradeCost : String) : Void {
        this.downGradeCost = downGradeCost;
    }

    public function getDownGradeCost() : String {
        return this.downGradeCost;
    }

}

