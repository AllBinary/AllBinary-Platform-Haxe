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
package org.allbinary.game.part;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.layer.AllBinaryLayer;

class CountedLayersHudPaintable implements PaintableInterface implements UpdateMyFontInterface {
    private static var XXStringWidth : Int = 0;
    private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final partInterfaceArray : haxe.ds.Vector<PartInterface>;
    private final countedTotalStringColor : Int;
    private final countedPartsBorder : Int;
    private final startIndex : Int;
    private final dropSize : Int;
    private var myFontProcessor : MyFontProcessor;
    private var height : Int = 0;
    public function new(partInterfaceArray : haxe.ds.Vector<PartInterface>, dropSize : Int, startIndex : Int, countedTotalStringColor : Int, countedPartsBorder : Int) {
        this.myFontProcessor = new UpdateMyFontProcessor(this);
        this.partInterfaceArray = partInterfaceArray;
        this.startIndex = startIndex;
        this.countedTotalStringColor = countedTotalStringColor;
        this.countedPartsBorder = countedPartsBorder;
        this.dropSize = dropSize;
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.height = font.getHeight();
        if (this.dropSize > font.getHeight()) {
            this.height = this.dropSize;
        }
        if (CountedLayersHudPaintable.XXStringWidth == 0) {
            final XXString : String = "XX";
            CountedLayersHudPaintable.XXStringWidth = font.stringWidth(XXString);
        }
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final lastWidth : Int = this.displayInfoSingleton.getLastWidth();
        final widthEdge : Int = lastWidth - this.dropSize;
        final size : Int = this.partInterfaceArray.length;
        var count : Int = 0;
        var y : Int = 0;
        var countedLayerInterfaceFactory : CountedLayerInterfaceFactoryPart = null;
        var pickedUpLayerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface = null;
        var layerInterface : AllBinaryLayer = null;
        var charArray : haxe.ds.Vector<Int> = null;
        for (index in this.startIndex...size) {
            countedLayerInterfaceFactory = (cast this.partInterfaceArray[index] : CountedLayerInterfaceFactoryPart);
            if (countedLayerInterfaceFactory.getTotal() > 0) {
                pickedUpLayerInterfaceFactoryInterface = countedLayerInterfaceFactory.getCountedPickedUpLayerInterfaceFactory();
                layerInterface = pickedUpLayerInterfaceFactoryInterface.getIconLayer();
                y = 40 + (count * this.height);
                layerInterface.setPosition(widthEdge, y, layerInterface.getZP());
                layerInterface.paint(graphics);
                graphics.setColor(this.countedTotalStringColor);
                countedLayerInterfaceFactory.paint(graphics);
                charArray = countedLayerInterfaceFactory.getTotalString();
                graphics.drawChars(charArray, 0, charArray.length, widthEdge - countedLayerInterfaceFactory.getXOffset(), y, 0);
                count++;
            }
        }
        if (count > 0) {
            graphics.setColor(this.countedPartsBorder);
            graphics.drawRect(lastWidth - (CountedLayersHudPaintable.XXStringWidth + this.dropSize), 40, CountedLayersHudPaintable.XXStringWidth + this.dropSize, (count * this.height) + 3);
        }
    }

    public function paintThreed(graphics : Graphics) : Void {
    }

}

