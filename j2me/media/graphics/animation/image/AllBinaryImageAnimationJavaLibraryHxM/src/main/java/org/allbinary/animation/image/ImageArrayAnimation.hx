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

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.graphics.Anchor;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.util.CircularIndexUtil;

class ImageArrayAnimation extends IndexedAnimation {
    private var imageArray : haxe.ds.Vector<Image> = NullImage.NULL_IMAGE_ARRAY;
    private var totalFrames : Int = 0;
    public var circularIndexUtil : CircularIndexUtil = CircularIndexUtil.NULL_CIRCULAR_INDEX_UTIL;
    public function new(imageArray : haxe.ds.Vector<Image>, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.setImageArray(imageArray);
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.getSize();
    }

    public override function nextFrame() : Void {
        this.circularIndexUtil.next();
    }

    public override function previousFrame() : Void {
        this.circularIndexUtil.previous();
    }

    public override function setFrame(index : Int) : Void {
        this.circularIndexUtil.setIndex(index);
    }

    public override function getFrame() : Int {
        return this.circularIndexUtil.getIndex();
    }

    public override function getSize() : Int {
        return this.totalFrames;
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public function getImage(index : Int) : Image {
        return this.imageArray[index];
    }

    public function getImageArray() : haxe.ds.Vector<Image> {
        return this.imageArray;
    }

    public function setImageArray(imageArray : haxe.ds.Vector<Image>) : Void {
        this.imageArray = imageArray;
        this.totalFrames = imageArray.length;
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.totalFrames);
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        graphics.drawImage(this.imageArray[this.circularIndexUtil.getIndex()], x, y, this.anchor);
    }

}

