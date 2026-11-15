/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.graphics.threed;

//import javax.microedition.lcdui.Font;
//import javax.microedition.midlet.MIDlet;

//SWTWithoutJOGL
class SWTJOGLProcessor implements Runnable {
    private static final instance : SWTJOGLProcessor = new SWTJOGLProcessor();
    public static function getInstance() : SWTJOGLProcessor {
        return SWTJOGLProcessor.instance;
    }

    public var glHolder : GLHolder = /* anonymous class body:
        public function run(renderer : Any) : Void {
        }

*/ new GLHolder();
    public function init(display : Any, comp : Any) : Void {
    }

    public function isHolderCreated() : Bool {
        return glHolder.isCreated;
    }

    public function setRenderer(renderer : Any) : Void {
    }

    public function isJOGL() : Bool {
        return false;
    }

    public function createSurface() : Void {
    }

    public function onSurfaceCreated() : Void {
    }

    public function onSurfaceChangedForEvent(event : Any) : Void {
    }

    public function onSurfaceChanged() : Void {
    }

    public function onSurfaceChangedWH(width : Int, height : Int) : Void {
    }

    public function addListener() : Void {
    }

    public function addListeners(midlet : MIDlet) : Void {
    }

    public function run() : Void {
    }

    public function clear() : Void {
    }

    public function setCustom(width : Int, height : Int, ratio : Float) : Void {
    }

    public function setRatioProcessor(ratioProcessor : RatioProcessor) : Void {
    }

    public function charWidth(font : Font, ch : Int) : Int {
        throw new haxe.Exception();
    }

    public function charsWidth(font : Font, ch : haxe.ds.Vector<Int>, offset : Int, length : Int) : Int {
        throw new haxe.Exception();
    }

    public function stringWidth(font : Font, str : String) : Int {
        throw new haxe.Exception();
    }

    public function substringWidth(font : Font, str : String, offset : Int, len : Int) : Int {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

