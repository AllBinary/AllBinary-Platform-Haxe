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
package org.allbinary.view;


class StaticViewPosition extends ViewPosition {
    public function new(x : Int, y : Int, z : Int) {
        super(x, y, z);
    }

    public override function getX() : Int {
        return this.getRawX();
    }

    public override function getY() : Int {
        return this.getRawY();
    }

    public override function getZ() : Int {
        return this.getRawZ();
    }

}

