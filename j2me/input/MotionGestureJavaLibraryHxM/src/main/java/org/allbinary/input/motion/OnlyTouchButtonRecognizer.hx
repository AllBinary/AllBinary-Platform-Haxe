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

import org.allbinary.input.motion.button.TouchButtonRecognizer;

class OnlyTouchButtonRecognizer extends MotionRecognizer {
    private final touchButtonRecognizer : TouchButtonRecognizer;
    private var touchButtonProcessing : Bool = false;
    public function new() {
        super();
        this.touchButtonRecognizer = new TouchButtonRecognizer();
    }

    // throws Exception
    public override function processStartMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        if (this.touchButtonRecognizer.pressTouchButtonInput(x, y, deviceId)) {
            this.touchButtonProcessing = true;
        }
    }

    // throws Exception
    public override function processEndMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        if (this.touchButtonProcessing) {
            this.touchButtonProcessing = false;
        }
        if (this.touchButtonRecognizer.releaseTouchButtonInput(x, y, deviceId)) {
            return;
        }
    }

    // throws Exception
    public override function processDraggedMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        if (this.touchButtonProcessing) {
            this.touchButtonRecognizer.pressTouchButtonInput(x, y, deviceId);
        }
    }

}

