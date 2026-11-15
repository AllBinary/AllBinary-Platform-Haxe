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
package org.allbinary.input.gyro;

import org.allbinary.game.input.InputFactory;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.logic.NullUtil;

class OrientationMotionGestureFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : OrientationMotionGestureFactory {
        if (OrientationMotionGestureFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            OrientationMotionGestureFactory.instance = new OrientationMotionGestureFactory();
        }
        return (cast OrientationMotionGestureFactory.instance : OrientationMotionGestureFactory);
    }

    public final LEFT : MotionGestureInput;
    public final RIGHT : MotionGestureInput;
    public final UP : MotionGestureInput;
    public final DOWN : MotionGestureInput;
    public final ROLL_LEFT : MotionGestureInput;
    public final ROLL_RIGHT : MotionGestureInput;
    public function new() {
        var MAX : Int = InputFactory.getInstance().MAX;
        this.LEFT = new MotionGestureInput(MAX - 20, "Left Orient");
        this.RIGHT = new MotionGestureInput(MAX - 21, "Right Orient");
        this.UP = new MotionGestureInput(MAX - 22, "Up Orient");
        this.DOWN = new MotionGestureInput(MAX - 23, "Down Orient");
        this.ROLL_LEFT = new MotionGestureInput(MAX - 24, "Roll Left");
        this.ROLL_RIGHT = new MotionGestureInput(MAX - 25, "Roll Right");
    }

}

