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
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.logic.java.character.CharArrayFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.input.motion.button.CommonButtons;

class UpgradableRTSLayerHudPaintable extends SelectionHudPaintable {
    private static final instance : UpgradableRTSLayerHudPaintable = new UpgradableRTSLayerHudPaintable();
    public static function getInstance() : UpgradableRTSLayerHudPaintable {
        return UpgradableRTSLayerHudPaintable.instance;
    }

    private final PERCENT : String = "%";
    private var rtsLayer : CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance();
    public var costY : Int = 0;
    public var costY1 : Int = 0;
    private var percentCompleteX2 : Int = 0;
    private var rtsLayerCompositePaintableLateInit : RTSLayerCompositePaintable = null;
    private var charHeight : Int = 0;
    private var charWidth : Int = 0;
    public function new() {
        super();
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        super.updateMeasurement(graphics);
        final font : Font = graphics.getFont();
        this.charHeight = font.getHeight();
        this.charWidth = MyFontProcessor.defaultCharWidth(font);
    }

    public override function update() : Void {
        super.update();
        final commonButtons : CommonButtons = CommonButtons.getInstance();
        this.costY = (this.y + commonButtons.STANDARD_BUTTON_SIZE);
        this.costY1 = (this.y + commonButtons.STANDARD_BUTTON_SIZE - this.charHeight);
        this.percentCompleteX2 = this.imageX + commonButtons.STANDARD_BUTTON_SIZE - this.charWidth;
        final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        if (displayInfoSingleton.getLastWidth() > 320) {
            this.rtsLayerCompositePaintableLateInit = new UpgradableWideRTSLayerPaintable(this);
        } else {
            this.rtsLayerCompositePaintableLateInit = new RTSLayerCompositePaintable(this);
        }
    }

    public override function updateSelectionInfo() : Void {
        final rtsLayer : RTSLayer = (cast this.getRtsLayer() : RTSLayer);
        this.rtsLayerCompositePaintableLateInit.update(rtsLayer);
        this.setAnimationInterface(rtsLayer.getVerticleBuildAnimationInterface());
        this.setName(rtsLayer.getName());
    }

    private var percentComplete : Int = 0;
    private var percentCompleteX : Int = 0;
    private var percentCompleteArray : haxe.ds.Vector<Int> = CharArrayFactory.getInstance().getZeroCharArray();
    private var currentTotalDigits : Int = 0;
    public override function updateInfo() : Void {
        final rtsLayer : RTSLayer = (cast this.getRtsLayer() : RTSLayer);
        this.percentComplete = rtsLayer.getPercentComplete();
        if (this.percentComplete < 10) {
            this.percentCompleteX = 32;
        } else if (this.percentComplete < 100) {
            this.percentCompleteX = 24;
        } else {
            this.percentCompleteX = 16;
        }
        this.percentCompleteArray = this.getPrimitiveLongUtil().getCharArray(this.percentComplete);
        this.currentTotalDigits = this.getPrimitiveLongUtil().getCurrentTotalDigits();
    }

    public override function paint(graphics : Graphics) : Void {
        super.paint(graphics);
        this.rtsLayerCompositePaintableLateInit.paint(graphics);
        graphics.drawChars(this.percentCompleteArray, 0, this.currentTotalDigits, this.imageX + this.percentCompleteX, this.costY, 0);
        graphics.drawString(this.PERCENT, this.percentCompleteX2, this.costY, 0);
        this.getAnimationInterface().paintXY(graphics, this.imageX, this.y);
    }

    public function setRtsLayer(rtsLayer : RTSLayer) : Void {
        this.rtsLayer = rtsLayer;
    }

    public function getRtsLayer() : CollidableDestroyableDamageableLayer {
        return this.rtsLayer;
    }

}

