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
package org.allbinary.game.paint;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.ColorCompositeInterface;
import org.allbinary.graphics.paint.Paintable;

class ColorFillBasePaintable extends Paintable implements ColorCompositeInterface {
    public var basicColor : BasicColor = BasicColorFactory.getInstance().WHITE;
    public var colorP : Int = 0;
    public function new(basicColor : BasicColor) {
        super();
        this.setBasicColorP(basicColor);
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
        this.setColor(Std.int(this.getBasicColorP()));
    }

    public override function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

    public function getColor() : Int {
        return this.colorP;
    }

    public function setColor(color : Int) : Void {
        this.colorP = color;
    }

    public override function paint(graphics : Graphics) : Void {
    }

}

