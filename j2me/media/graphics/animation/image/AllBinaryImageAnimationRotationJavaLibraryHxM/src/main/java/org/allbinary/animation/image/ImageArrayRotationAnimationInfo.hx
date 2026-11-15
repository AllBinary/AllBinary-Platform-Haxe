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
package org.allbinary.animation.image;

//import javax.microedition.lcdui.Image;
import org.allbinary.math.AngleInfo;

class ImageArrayRotationAnimationInfo {
    private var imageArray : haxe.ds.Vector<Image>;
    private var angleIncrement : Int;
    private var totalAngle : Int;
    private var dx : Int;
    private var dy : Int;
    public function new(imageArray : haxe.ds.Vector<Image>, angleIncrement : Int, totalAngle : Int, dx : Int, dy : Int) {
        this.imageArray = imageArray;
        this.angleIncrement = angleIncrement;
        this.totalAngle = totalAngle;
        this.dx = dx;
        this.dy = dy;
    }

    public function setImageArray(imageArray : haxe.ds.Vector<Image>) : Void {
        this.imageArray = imageArray;
    }

    public function getImageArray() : haxe.ds.Vector<Image> {
        return this.imageArray;
    }

    public function getAngleInfoP() : AngleInfo {
        return AngleInfo.getInstance(this.angleIncrement);
    }

    public function setTotalAngle(totalAngle : Int) : Void {
        this.totalAngle = totalAngle;
    }

    public function getTotalAngle() : Int {
        return this.totalAngle;
    }

    public function setDx(dx : Int) : Void {
        this.dx = dx;
    }

    public function getDx() : Int {
        return this.dx;
    }

    public function setDy(dy : Int) : Void {
        this.dy = dy;
    }

    public function getDy() : Int {
        return this.dy;
    }

}

