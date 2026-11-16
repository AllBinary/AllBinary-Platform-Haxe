/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.view;

import org.allbinary.layer.AllBinaryLayer;

class ViewPosition extends ViewPositionBase {
    public static function getInstanceD() : ViewPosition {
        return new ViewPosition(0, 0, 0);
    }

    private var allbinaryLayer : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    public function new(x : Int, y : Int, z : Int) {
        super(x, y, z);
    }

    public override function getX() : Int {
        return this.allbinaryLayer.getXP();
    }

    public override function getY() : Int {
        return this.allbinaryLayer.getYP();
    }

    public override function getZ() : Int {
        return this.allbinaryLayer.getZP();
    }

    public override function getX2() : Int {
        return this.getX() + this.allbinaryLayer.getWidth();
    }

    public override function getY2() : Int {
        return this.getY() + this.allbinaryLayer.getHeight();
    }

    public override function getZ2() : Int {
        return jre.lang.JavaNumber.toInt((this.getZ() + this.allbinaryLayer.getDepth()));
    }

    public override function setAllbinaryLayer(allbinaryLayer : Any) : Void {
        this.allbinaryLayer = (cast allbinaryLayer : AllBinaryLayer);
    }

}

