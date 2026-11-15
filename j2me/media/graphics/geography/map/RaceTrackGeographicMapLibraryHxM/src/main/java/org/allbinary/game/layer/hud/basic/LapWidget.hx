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
import org.allbinary.game.layer.hud.LapInfo;
import org.allbinary.graphics.color.BasicColor;

class LapWidget extends BasicHud {
    private final LAP_STR : String = "Lap ";
    private final OF_STR : String = " of ";
    private var string : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(location : Int, direction : Int, basicColor : BasicColor) {
        super(location, direction, 2, basicColor);
        this.updateMaxHeight = 15;
        this.updateMaxWidth = 40;
    }

    public function update(lapInfo : LapInfo) : Void {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(this.LAP_STR);
        stringBuffer.appendint(Std.int(lapInfo.getCurrentLap()));
        stringBuffer.append(this.OF_STR);
        stringBuffer.appendint(Std.int(lapInfo.getTotalLaps()));
        this.string = stringBuffer.toString();
    }

    public function paint(graphics : Graphics) : Void {
        super.paintString(graphics, this.string);
    }

}

