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
package org.allbinary.animation.vector;

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.ColorCompositeInterface;
import org.allbinary.layer.PositionInterface;
import org.allbinary.logic.NullUtil;

class LineAnimation extends Animation implements ColorCompositeInterface implements PositionInterface {
    private var newLine : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...2) 0])]);
    private var tempLine : haxe.ds.Vector<haxe.ds.Vector<Int>> = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY;
    private var line : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...2) 0])]);
    public function new(basicColor : BasicColor) {
        super();
        this.setBasicColorP(basicColor);
    }

    public function init(x : Int, y : Int) : Void {
        this.newLine[0][0] = x;
        this.newLine[0][1] = y;
        this.newLine[1][0] = x;
        this.newLine[1][1] = y;
        this.tempLine = this.line;
        this.line = this.newLine;
        this.newLine = this.tempLine;
    }

    public function setPosition(x : Int, y : Int, z : Int) : Void {
        this.newLine[0][0] = this.line[1][0];
        this.newLine[0][1] = this.line[1][1];
        this.newLine[1][0] = x;
        this.newLine[1][1] = y;
        this.tempLine = this.line;
        this.line = this.newLine;
        this.newLine = this.tempLine;
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        final currentLine : haxe.ds.Vector<haxe.ds.Vector<Int>> = this.line;
        this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
        graphics.drawLine(currentLine[0][0], currentLine[0][1], currentLine[1][0], currentLine[1][1]);
    }

    public override function nextFrame() : Void {
    }

    public override function getBasicColorP() : BasicColor {
        return super.getBasicColorP();
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        super.setBasicColorP(basicColor);
    }

}

