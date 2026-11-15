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

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.AndroidUtil;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.part.weapon.BasicWeaponPart;
import org.allbinary.graphics.font.UpdateMyFontInterface;

class RTSLayerHudPaintable extends SelectionHudPaintable implements UpdateMyFontInterface {
    private static final instance : RTSLayerHudPaintable = new RTSLayerHudPaintable();
    public static function getInstance() : RTSLayerHudPaintable {
        return RTSLayerHudPaintable.instance;
    }

    private var weaponProperties : haxe.ds.Vector<String> = StringUtil.getInstance().getArrayInstance();
    private var rtsLayer : CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance();
    public var costY : Int = 0;
    public var costY1 : Int = 0;
    private var fontHeight : Int = 0;
    public function new() {
        super();
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        super.updateMeasurement(graphics);
        final font : Font = graphics.getFont();
        this.fontHeight = font.getHeight();
        this.costY1 = (this.y + ((this.weaponProperties.length + 1) * this.fontHeight));
        if (!AndroidUtil.isAndroid()) {
            this.costY = this.costY1;
        } else {
            this.costY = (this.y + ((this.weaponProperties.length + 2) * this.fontHeight));
        }
    }

    public override function updateSelectionInfo() : Void {
        this.setName(this.getRtsLayer().getName());
        final partInterface : BasicWeaponPart = (cast this.getRtsLayer().getPartInterfaceArray()[0] : BasicWeaponPart);
        this.weaponProperties = partInterface.getWeaponProperties().toStringArray();
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public override function paint(graphics : Graphics) : Void {
        super.paint(graphics);
        final size : Int = this.weaponProperties.length;
        for (index in 0...size) {
            graphics.drawString(this.weaponProperties[index], this.textX, this.y + ((index + 1) * this.fontHeight), 0);
        }
    }

    public function setRtsLayer(rtsLayer : RTSLayer) : Void {
        this.rtsLayer = rtsLayer;
    }

    private function getRtsLayer() : CollidableDestroyableDamageableLayer {
        return this.rtsLayer;
    }

}

