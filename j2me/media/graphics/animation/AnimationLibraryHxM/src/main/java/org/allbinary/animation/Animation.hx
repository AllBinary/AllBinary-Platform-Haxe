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
package org.allbinary.animation;

import javax.microedition.khronos.opengles.GL;
import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface;

class Animation implements AnimationInterface implements OpenGLSurfaceChangedInterface {
    public final basicSetColorUtil : BasicColorSetUtil = BasicColorSetUtil.getInstance();
    public var basicColor : BasicColor = BasicColorFactory.getInstance().WHITE;
    public var colorP : Int = 0;
    public var changeBasicColorP : BasicColor = BasicColorFactory.getInstance().NULL_COLOR;
    public var changeColorP : Int = 0;
    public var alphaP : Int = 0;
    public function new() {
    }

    public function setAlpha(alpha : Int) : Void {
        this.alphaP = alpha;
    }

    // throws Exception
    public function nextFrame() : Void {
    }

    public function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
    }

    public function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
    }

    public function isThreed() : Bool {
        return false;
    }

    public function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

    public function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
        this.colorP = this.basicColor.intValue();
    }

    public function setBackgroundBasicColorP(basicColor : BasicColor) : Void {
    }

    public function getChangeBasicColor() : BasicColor {
        return this.changeBasicColorP;
    }

    public function changeBasicColor(basicColor : BasicColor) : Void {
        this.changeBasicColorP = basicColor;
        this.changeColorP = this.changeBasicColorP.intValue();
    }

    public function getChangeColor() : Int {
        return this.changeColorP;
    }

    public function getColor() : Int {
        return this.colorP;
    }

    public function setScale(scaleX : Float, scaleY : Float) : Void {
    }

    public function setMaxScale(maxScaleX : Float, maxScaleY : Float) : Void {
    }

    // throws Exception
    public function set(gl : GL) : Void {
    }

    public function setDx(dx : Int) : Void {
    }

    public function getDx() : Int {
        return 0;
    }

    public function setDy(dy : Int) : Void {
    }

    public function getDy() : Int {
        return 0;
    }

}

