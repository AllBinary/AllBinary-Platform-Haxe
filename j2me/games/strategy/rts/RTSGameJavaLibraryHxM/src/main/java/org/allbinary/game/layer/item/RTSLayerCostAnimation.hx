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
package org.allbinary.game.layer.item;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.game.layer.CostLayerInterfaceFactoryInterface;
import org.allbinary.game.rts.technology.event.TechEventListenerInterface;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.animation.Animation;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.math.PrimitiveLongUtil;
import org.allbinary.logic.util.event.EventStrings;

class RTSLayerCostAnimation extends Animation implements TechEventListenerInterface implements UpdateMyFontInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final primitiveLongUtil : PrimitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(10000);
    private final DOLLAR : String = "$";
    private final image : Image;
    private final layerInterfaceFactoryInterface : CostLayerInterfaceFactoryInterface;
    private var myFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    private var costString : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_CHAR_ARRAY;
    private var len : Int = 0;
    private var adjustedCostX : Int = 0;
    private var fontHeight : Int = 0;
    public function new(image : Image, layerInterfaceFactoryInterface : CostLayerInterfaceFactoryInterface) {
        super();
        this.image = image;
        this.layerInterfaceFactoryInterface = layerInterfaceFactoryInterface;
        this.update();
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.fontHeight = font.getHeight();
        this.adjustedCostX = font.stringWidth(this.DOLLAR);
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function onEvent(event : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public override function onTechEvent(event : AllBinaryEventObject) : Void {
        try {
            this.update();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "onTechEvent", e);
        }
    }

    // throws Exception
    public function update() : Void {
        this.len = 0;
        this.costString = this.primitiveLongUtil.getCharArray(this.layerInterfaceFactoryInterface.getCost());
        this.len = this.primitiveLongUtil.getCurrentTotalDigits();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.myFontProcessor.process(graphics);
        super.paintXY(graphics, x, y);
        final adjustedCostY : Int = this.image.getHeight() - this.fontHeight;
        var xa : Int = x + 2;
        graphics.drawString(this.DOLLAR, xa, y + adjustedCostY, 0);
        graphics.drawChars(this.costString, 0, this.len, x + this.adjustedCostX, y + adjustedCostY, 0);
    }

}

