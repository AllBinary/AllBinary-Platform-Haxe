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
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class UpgradableWideRTSLayerPaintable extends RTSLayerCompositePaintable {
    private var cost : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(upgradableRTSLayerHudPaintable : UpgradableRTSLayerHudPaintable) {
        super(upgradableRTSLayerHudPaintable);
    }

    public override function update(rtsLayer : RTSLayer) : Void {
        super.update(rtsLayer);
        this.setCost(new StringMaker().append(this.getUpgradeCost()).append(CommonSeps.getInstance().SPACE).append(this.getDownGradeCost()).toString());
    }

    public override function paint(graphics : Graphics) : Void {
        graphics.drawString(this.getCost(), this.upgradableRTSLayerHudPaintable.textX, this.upgradableRTSLayerHudPaintable.costY, 0);
    }

    public function setCost(cost : String) : Void {
        this.cost = cost;
    }

    public function getCost() : String {
        return this.cost;
    }

}

