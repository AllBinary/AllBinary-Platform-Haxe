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
package org.allbinary.canvas;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;

class GameGlobalsFactory {
    private static final instance : GameGlobalsFactory = new GameGlobalsFactory();
    public static function getInstance() : GameGlobalsFactory {
        return GameGlobalsFactory.instance;
    }

    public var newCanvas : Bool = true;
    public var newDisplaybleTime : haxe.Int64 = haxe.Int64.ofInt(Integer.MIN_VALUE);
    public var point : GPoint = PointFactory.getInstance().ZERO_ZERO;
    public function new() {
    }
}

