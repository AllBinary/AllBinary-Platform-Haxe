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
package org.allbinary.graphics;


class CustomGPoint extends GPoint {
    public static final NULL_CUSTOM_POINT : CustomGPoint = new CustomGPoint(0, 0, 0);
    public static function getInstance(point : GPoint) : CustomGPoint {
        return new CustomGPoint(point.getX(), point.getY(), point.getZ());
    }

    public static function getInstance3(x : Int, y : Int) : CustomGPoint {
        return new CustomGPoint(x, y, 3);
    }

    private var cx : Int = 0;
    private var cy : Int = 0;
    private var cz : Int = 0;
    public function new(x : Int, y : Int, z : Int) {
        super(x, y, z);
    }

    public function setX(x : Int) : Void {
        this.cx = x;
    }

    public override function getX() : Int {
        return this.cx;
    }

    public function setY(y : Int) : Void {
        this.cy = y;
    }

    public override function getY() : Int {
        return this.cy;
    }

    public function setZ(z : Int) : Void {
        this.cz = z;
    }

    public override function getZ() : Int {
        return this.cz;
    }

}

