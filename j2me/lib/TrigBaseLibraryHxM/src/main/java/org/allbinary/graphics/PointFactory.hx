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
package org.allbinary.graphics;

import jsinterop.annotations.JsType;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsConstructor;
import jsinterop.annotations.JsProperty;

class PointFactory {
    private static final instance : PointFactory = new PointFactory();
    public static function getInstance() : PointFactory {
        return PointFactory.instance;
    }

    public var ZERO_ZERO : GPoint = this.createXYZ(0, 0, 0);
    public function init() : Void {
    }

    public function new() {
    }

    public function createXY(x : Int, y : Int) : GPoint {
        return new GPoint(x, y, 0);
    }

    public function createXYZ(x : Int, y : Int, z : Int) : GPoint {
        return new GPoint(x, y, z);
    }

}

