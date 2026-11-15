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
package org.allbinary.layer;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class Layer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final ID : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(0);
    public var x : Int = 0;
    public var y : Int = 0;
    public var z : Int = 3;
    private var width : Int = 0;
    private var height : Int = 0;
    private var visible : Bool = true;
    public function new(width : Int, height : Int) {
        this.setLayerWidth(width);
        this.setLayerHeight(height);
    }

    public function setPosition(x : Int, y : Int, z : Int) : Void {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public function moveDXY(dx : Int, dy : Int) : Void {
        this.x += dx;
        this.y += dy;
    }

    public function moveDXYZ(dx : Int, dy : Int, dz : Int) : Void {
        this.x += dx;
        this.y += dy;
        this.z += dz;
    }

    public function getXP() : Int {
        return this.x;
    }

    public function getYP() : Int {
        return this.y;
    }

    public function getZP() : Int {
        return this.z;
    }

    public function getWidth() : Int {
        return this.width;
    }

    public function getHeight() : Int {
        return this.height;
    }

    public function getDepth() : haxe.Int64 {
        return 0;
    }

    public function setVisible(visible : Bool) : Void {
        this.visible = visible;
    }

    public function isVisible() : Bool {
        return this.visible;
    }

    public function paint(graphics : Graphics) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final canvasStrings : CanvasStrings = CanvasStrings.getInstance();
        this.logUtil.putF(commonStrings.NOT_IMPLEMENTED, this, canvasStrings.PAINT);
    }

    public function setLayerWidth(width : Int) : Void {
        if (width < 0) {
            throw new IllegalArgumentException();
        }
        this.width = width;
    }

    public function setLayerHeight(height : Int) : Void {
        if (height < 0) {
            throw new IllegalArgumentException();
        }
        this.height = height;
    }

    public function toStringAppend(stringBuffer : StringMaker) : Void {
    }

}

