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
package org.allbinary.direction;

import org.allbinary.math.Angle;
import org.allbinary.math.AngleFactory;

class DirectionUtil {
    private static final instance : DirectionUtil = new DirectionUtil();
    public static function getInstance() : DirectionUtil {
        return DirectionUtil.instance;
    }

    private var directionArray : haxe.ds.Vector<Angle> = haxe.ds.Vector.fromArrayCopy([for (index in 0...10) null]);
    private var directionArray2 : haxe.ds.Vector<Angle> = haxe.ds.Vector.fromArrayCopy([for (index in 0...10) null]);
    public function new() {
        var angleFactory : AngleFactory = AngleFactory.getInstance();
        var directionFactory : DirectionFactory = DirectionFactory.getInstance();
        this.directionArray[directionFactory.LEFT.getValue()] = angleFactory.LEFT;
        this.directionArray[directionFactory.RIGHT.getValue()] = angleFactory.RIGHT;
        this.directionArray[directionFactory.UP.getValue()] = angleFactory.UP;
        this.directionArray[directionFactory.DOWN.getValue()] = angleFactory.DOWN;
        this.directionArray2[directionFactory.LEFT.getValue()] = angleFactory.LEFT;
        this.directionArray2[directionFactory.RIGHT.getValue()] = angleFactory.RIGHT;
        this.directionArray2[directionFactory.UP.getValue()] = angleFactory.UP;
        this.directionArray2[directionFactory.DOWN.getValue()] = angleFactory.DOWN;
    }

    public function getAngle(direction : Direction) : Angle {
        return this.directionArray2[direction.getValue()];
    }

    public function getFrameAngle(direction : Direction) : Angle {
        return this.directionArray[direction.getValue()];
    }

}

