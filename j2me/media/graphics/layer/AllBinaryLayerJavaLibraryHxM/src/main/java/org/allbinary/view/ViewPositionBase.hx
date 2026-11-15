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

import org.allbinary.graphics.GPoint;

class ViewPositionBase extends GPoint {
    public static final NULL_VIEW_POSITION : ViewPositionBase = new ViewPositionBase(0, 0, 0);
    public function new(x : Int, y : Int, z : Int) {
        super(x, y, z);
    }

    public function getX2() : Int {
        return this.getX();
    }

    public function getY2() : Int {
        return this.getY();
    }

    public function getZ2() : Int {
        return this.getZ();
    }

    public function setAllbinaryLayer(allbinaryLayer : Any) : Void {
    }

}

