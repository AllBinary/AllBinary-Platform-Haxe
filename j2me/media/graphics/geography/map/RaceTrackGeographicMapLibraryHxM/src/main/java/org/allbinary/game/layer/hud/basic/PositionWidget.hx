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
package org.allbinary.game.layer.hud.basic;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.game.graphics.hud.BasicHud;
import org.allbinary.graphics.color.BasicColor;

//super.paint(graphics, positionString, currentPostString, offset2, offset);
class PositionWidget extends BasicHud {
    private var position : Int = 0;
    private var positionString : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(position : Int, location : Int, direction : Int, basicColor : BasicColor) {
        super(location, direction, 2, basicColor);
        this.updateMaxHeight = 10;
        this.updateMaxWidth = 40;
    }

    public function get() : Int {
        return this.position;
    }

    public function set(position : Int) : Void {
        this.position = position;
        this.positionString = PositionWidget.toString(this.get());
    }

    public function paint(graphics : Graphics) : Void {
        super.paintString(graphics, this.positionString);
    }

    public static function toString(position : Int) : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Std.string(position));
        if (position == 1) {
            stringBuffer.append("st");
        } else if (position == 2) {
            stringBuffer.append("nd");
        } else if (position == 3) {
            stringBuffer.append("rd");
        } else {
            stringBuffer.append("th");
        }
        return stringBuffer.toString();
    }

}

