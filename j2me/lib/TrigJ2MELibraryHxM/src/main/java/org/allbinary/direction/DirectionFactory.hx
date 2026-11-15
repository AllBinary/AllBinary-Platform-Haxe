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
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;

class DirectionFactory {
    private static final instance : DirectionFactory = new DirectionFactory();
    public static function getInstance() : DirectionFactory {
        return DirectionFactory.instance;
    }

    public final NAME : String = "DIRECTION";
    public final LEFT : Direction = new Direction(CommonPhoneStrings.getInstance().LEFT, "WEST", 0, 1);
    public final RIGHT : Direction = new Direction(CommonPhoneStrings.getInstance().RIGHT, "EAST", 1, 0);
    public final DOWN : Direction = new Direction(CommonPhoneStrings.getInstance().DOWN, "SOUTH", 2, 0);
    public final UP : Direction = new Direction(CommonPhoneStrings.getInstance().UP, "NORTH", 3, 0);
    public final UP_LEFT : Direction;
    public final UP_RIGHT : Direction;
    public final DOWN_LEFT : Direction;
    public final DOWN_RIGHT : Direction;
    public final NOT_BORDERED_WITH : Direction = new Direction("NOT_BORDERED_WITH", "NOT_BORDERED_WITH", 8, 0);
    public final NO_DIRECTION : Direction = new Direction("NO_DIRECTION", "NO_DIRECTION", 9, 0);
    public final TOP : Direction = new Direction("TOP", "TOP", 10, 0);
    public final BOTTOM : Direction = new Direction("BOTTOM", "BOTTOM", 11, 0);
    public final ALL_DIRECTION : Direction = new Direction("ALL_DIRECTION", "ALL_DIRECTION", 12, 0);
    public function new() {
        var stringBuffer : StringMaker = new StringMaker();
        var commonSeps : CommonSeps = CommonSeps.getInstance();
        this.UP_LEFT = new Direction("UP LEFT", Std.string(stringBuffer.append(this.UP.getOtherName()).append(commonSeps.SPACE).append(this.LEFT.getOtherName())), 4, 0);
        stringBuffer.delete(0, stringBuffer.length());
        this.UP_RIGHT = new Direction("UP RIGHT", Std.string(stringBuffer.append(this.UP.getOtherName()).append(commonSeps.SPACE).append(this.RIGHT.getOtherName())), 5, 0);
        stringBuffer.delete(0, stringBuffer.length());
        this.DOWN_LEFT = new Direction("DOWN LEFT", Std.string(stringBuffer.append(this.DOWN.getOtherName()).append(commonSeps.SPACE).append(this.LEFT.getOtherName())), 6, 0);
        stringBuffer.delete(0, stringBuffer.length());
        this.DOWN_RIGHT = new Direction("DOWN RIGHT", Std.string(stringBuffer.append(this.DOWN.getOtherName()).append(commonSeps.SPACE).append(this.RIGHT.getOtherName())), 7, 0);
    }

}

