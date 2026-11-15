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
package org.allbinary.input.motion;


class AllMotionRecognizer {
    private final id : Int;
    private static var index : Int = 0;
    public function new() {
        this.id = AllMotionRecognizer.index++;
    }

    // throws Exception
    public function processStartMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
    }

    // throws Exception
    public function processEndMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
    }

    // throws Exception
    public function processDraggedMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
    }

    // throws Exception
    public function processMovedMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
    }

    // throws Exception
    public function processScrolledMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
    }

    public function getId() : Int {
        return this.id;
    }

}

