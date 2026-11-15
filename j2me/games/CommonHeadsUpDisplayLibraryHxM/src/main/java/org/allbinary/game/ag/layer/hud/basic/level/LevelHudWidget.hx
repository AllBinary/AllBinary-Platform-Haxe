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
package org.allbinary.game.ag.layer.hud.basic.level;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.graphics.hud.BasicHud;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.math.PrimitiveLongUtil;

class LevelHudWidget extends BasicHud implements PaintableInterface {
    // throws Exception
    public static function createHud(maxlevel : Int, location : Int, direction : Int) : LevelHudWidget {
        return new LevelHudWidget(maxlevel, location, direction);
    }

    private var level : Int;
    private var maxlevel : Int;
    private final levelString : haxe.ds.Vector<Int>;
    private var levelNumberCharArray : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_CHAR_ARRAY;
    private var levelNumberTotalDigits : Int = 0;
    private var offset : Int = 0;
    private final primitiveLongUtil : PrimitiveLongUtil;
    public function new(maxlevel : Int, location : Int, direction : Int) {
        super(location, direction, 2, BasicColorFactory.getInstance().GREY);
        this.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(1000);
        final LEVEL : String = "Lv ";
        this.levelString = haxe.ds.Vector.fromArrayCopy([for (index in 0...LEVEL.length) LEVEL.charCodeAt(index)]);
        this.maxlevel = maxlevel;
        this.level = maxlevel;
        this.update();
        this.updateMaxHeight = 14;
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.updateMaxWidth = font.getSize() * 4;
        this.offset = font.charsWidth(this.levelString, 0, this.levelString.length) + font.getSize();
        super.updateMeasurement(graphics);
    }

    private function update() : Void {
        this.levelNumberCharArray = this.primitiveLongUtil.getCharArray(this.level);
        this.levelNumberTotalDigits = this.primitiveLongUtil.getCurrentTotalDigits();
    }

    public function setLevel(level : Int) : Void {
        this.level = level;
        this.update();
    }

    public function nextLevel() : Void {
        this.level++;
        this.update();
    }

    public function previousLevel() : Void {
        this.level--;
        if (this.level < 0) {
            this.level = 0;
        }
        this.update();
    }

    public function isComplete() : Bool {
        if (this.level <= this.maxlevel) {
            return false;
        } else {
            return true;
        }
    }

    public override function paint(graphics : Graphics) : Void {
        super.paintDX(graphics, this.levelString, 0, this.levelString.length, this.levelNumberCharArray, 0, this.levelNumberTotalDigits, this.offset);
    }

    public override function paintThreed(graphics : Graphics) : Void {
    }

}

