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
package org.allbinary.graphics.displayable.screen;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;

class DisplayPointScalar {
    private static final instance : DisplayPointScalar = new DisplayPointScalar();
    public static function getInstance() : DisplayPointScalar {
        return DisplayPointScalar.instance;
    }

    public function new() {
    }

    public function processX(value : Int) : Int {
        return value;
    }

    public function processY(value : Int) : Int {
        return value;
    }

    public function process(point : GPoint) : GPoint {
        return point;
    }

}

