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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.NullUtil;

class MultiSelectPaintable extends SelectionHudPaintable {
    private final rootNameList : BasicArrayList = new BasicArrayListD();
    private var totalCharArray : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_CHAR_ARRAY;
    private var rootNamesString : String = StringUtil.getInstance().EMPTY_STRING;
    private final TOTAL : String = "Total Selected: ";
    private final backgroundColor : Int = Std.int(BasicColorFactory.getInstance().GREY);
    private var totalWidth : Int = 0;
    private var textLine2Y : Int = 0;
    public function new() {
        super();
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        super.updateMeasurement(graphics);
        final font : Font = graphics.getFont();
        this.totalWidth = font.stringWidth(this.TOTAL);
        this.textLine2Y = (this.y + font.getHeight());
    }

    public function update(list : BasicArrayList) : Void {
        this.clear();
        var size : Int = list.size();
        this.totalCharArray = this.getPrimitiveLongUtil().getCharArray(size);
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            var rtsLayer : RTSLayer = (cast list.get(index) : RTSLayer);
            if (!this.rootNameList.contains(rtsLayer.getRootName())) {
                this.rootNameList.add(rtsLayer.getRootName());
            }
                index--;
            }
        }
        final COMMA_SEP : String = CommonSeps.getInstance().COMMA_SEP;
        final stringBuffer : StringMaker = new StringMaker();
        {
            var index : Int = this.rootNameList.size() - 1;
            while (index >= 0) {
            var rootName : String = (cast this.rootNameList.get(index) : String);
            stringBuffer.append(rootName);
            if (index != 0) {
                stringBuffer.append(COMMA_SEP);
            }
                index--;
            }
        }
        this.rootNamesString = stringBuffer.toString();
    }

    private function clear() : Void {
        this.rootNameList.clear();
    }

    public override function paint(graphics : Graphics) : Void {
        graphics.setColor(this.backgroundColor);
        graphics.drawRect(this.getX(), this.y, this.getWidth(), this.getHeight());
        graphics.setColor(this.getColor());
        graphics.drawString(this.TOTAL, this.textX, this.y, 0);
        graphics.drawChars(this.totalCharArray, 0, this.getPrimitiveLongUtil().getCurrentTotalDigits(), this.textX + this.totalWidth, this.y, 0);
        graphics.drawString(this.rootNamesString, this.textX, this.textLine2Y, 0);
    }

}

