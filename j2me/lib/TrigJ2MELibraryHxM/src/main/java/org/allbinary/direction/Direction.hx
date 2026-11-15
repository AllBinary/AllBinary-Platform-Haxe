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

import org.allbinary.logic.string.StringMaker;

class Direction {
    private static var directionArray : haxe.ds.Vector<Direction> = haxe.ds.Vector.fromArrayCopy([for (index in 0...13) null]);
    private var name : String;
    private var otherName : String;
    private var value : Int;
    private var frameFactor : Int;
    public function new(name : String, otherName : String, value : Int, frameFactor : Int) {
        this.name = name;
        this.otherName = otherName;
        this.value = value;
        this.frameFactor = frameFactor;
        Direction.directionArray[value] = this;
    }

    public static function getInstance(direction : Int) : Direction {
        return Direction.directionArray[direction];
    }

    public function getValue() : Int {
        return this.value;
    }

    public function getFrameFactor() : Int {
        return this.frameFactor;
    }

    public function getOtherName() : String {
        return this.otherName;
    }

    public function getName() : String {
        return this.name;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Direction: ");
        stringBuffer.append(this.getName());
        stringBuffer.append(" Or: ");
        stringBuffer.append(this.getOtherName());
        stringBuffer.append(" Value: ");
        stringBuffer.appendint(this.value);
        return Std.string(stringBuffer);
    }

}

