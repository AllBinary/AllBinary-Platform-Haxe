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
package org.allbinary.math;


class AngleIncrementInfoFactory {
    private static final instance : AngleIncrementInfoFactory = new AngleIncrementInfoFactory();
    public static function getInstance() : AngleIncrementInfoFactory {
        return AngleIncrementInfoFactory.instance;
    }

    private final angleIncrementInfo : haxe.ds.Vector<AngleIncrementInfo> = haxe.ds.Vector.fromArrayCopy([for (index in 0...Std.int(AngleFactory.getInstance().TOTAL_ANGLE)) null]);
    public function getAt(angleIncrement : Int) : AngleIncrementInfo {
        final halfAngleIncrement : Int = (angleIncrement >> 1);
        var angleIncrementInfo : AngleIncrementInfo = null;
        var angleIncrementInfoCanBeNull : AngleIncrementInfo = this.angleIncrementInfo[halfAngleIncrement];
        if (angleIncrementInfoCanBeNull == null) {
            angleIncrementInfo = new AngleIncrementInfo(angleIncrement);
            this.angleIncrementInfo[halfAngleIncrement] = angleIncrementInfo;
            return angleIncrementInfo;
        } else {
            angleIncrementInfo = angleIncrementInfoCanBeNull;
        }
        return angleIncrementInfo;
    }

    public function new() {
    }
}

