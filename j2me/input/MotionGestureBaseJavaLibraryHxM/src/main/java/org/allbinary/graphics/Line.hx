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


class Line {
    private var p1 : GPoint;
    private var p2 : GPoint;
    private var deltaX : Float = 0.0;
    private var deltaY : Float = 0.0;
    public function new(p1 : GPoint, p2 : GPoint) {
        this.p1 = PointFactory.getInstance().ZERO_ZERO;
        this.p2 = this.p1;
        this.setP1(p1);
        this.setP2(p2);
    }

    public function getGradient() : Float {
        return this.getDeltaY() / this.getDeltaX();
    }

    private function update() : Void {
        this.deltaX = this.getP1().getX() - this.getP2().getX();
        this.deltaY = this.getP1().getY() - this.getP2().getY();
    }

    public function getDeltaX() : Float {
        return this.deltaX;
    }

    public function getDeltaY() : Float {
        return this.deltaY;
    }

    public function getP1() : GPoint {
        return this.p1;
    }

    public function getP2() : GPoint {
        return this.p2;
    }

    public function setP1(p1 : GPoint) : Void {
        this.p1 = p1;
        this.update();
    }

    public function setP2(p2 : GPoint) : Void {
        this.p2 = p2;
        this.update();
    }

}

