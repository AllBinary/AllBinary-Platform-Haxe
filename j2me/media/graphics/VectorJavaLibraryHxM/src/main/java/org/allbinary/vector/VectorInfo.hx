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
package org.allbinary.vector;


class VectorInfo {
    private var width : Int;
    private var height : Int;
    private var points : haxe.ds.Vector<haxe.ds.Vector<Int>>;
    private var totalFrames : Int;
    public function new(width : Int, height : Int, points : haxe.ds.Vector<haxe.ds.Vector<Int>>, totalFrames : Int) {
        this.width = width;
        this.height = height;
        this.points = points;
        this.totalFrames = totalFrames;
    }

    public function getWidth() : Int {
        return this.width;
    }

    private function setWidth(width : Int) : Void {
        this.width = width;
    }

    public function getHeight() : Int {
        return this.height;
    }

    private function setHeight(height : Int) : Void {
        this.height = height;
    }

    public function getPoints() : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        return this.points;
    }

    private function setPoints(points : haxe.ds.Vector<haxe.ds.Vector<Int>>) : Void {
        this.points = points;
    }

    public function getTotalFrames() : Int {
        return this.totalFrames;
    }

    private function setTotalFrames(totalFrames : Int) : Void {
        this.totalFrames = totalFrames;
    }

}

