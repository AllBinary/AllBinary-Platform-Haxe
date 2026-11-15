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

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.util.CircularIndexUtil;

class ImageSegmentAnimation extends ImageAnimation {
    private var startX : Int;
    private var startY : Int;
    private var drawWidth : Int;
    private var drawHeight : Int;
    private var circularIndexUtil : CircularIndexUtil;
    private var sequenceArray : haxe.ds.Vector<Int>;
    public function new(image : Image, sequenceArray : haxe.ds.Vector<Int>, animationBehavior : AnimationBehavior) {
        super(image, animationBehavior);
        this.startX = 0;
        this.startY = 0;
        this.drawWidth = this.getImage().getWidth();
        this.drawHeight = this.getImage().getHeight();
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.drawHeight);
        this.sequenceArray = sequenceArray;
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
        return this.circularIndexUtil.getSize();
    }

    public override function setSequence(sequenceArray : haxe.ds.Vector<Int>) : Void {
        this.sequenceArray = sequenceArray;
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return this.sequenceArray;
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
    }

    public function getStartX() : Int {
        return this.startX;
    }

    public function setStartX(startX : Int) : Void {
        this.startX = startX;
    }

    public function getStartY() : Int {
        return this.startY;
    }

    public function setStartY(startY : Int) : Void {
        this.startY = startY;
    }

    public function getDrawWidth() : Int {
        return this.drawWidth;
    }

    public function setDrawWidth(drawWidth : Int) : Void {
        this.drawWidth = drawWidth;
    }

    public function getDrawHeight() : Int {
        return this.drawHeight;
    }

    public function setDrawHeight(drawHeight : Int) : Void {
        this.drawHeight = drawHeight;
    }

}

