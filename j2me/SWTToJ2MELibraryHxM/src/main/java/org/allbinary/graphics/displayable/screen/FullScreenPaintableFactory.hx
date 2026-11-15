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

import org.allbinary.game.paint.FullScreenPaintable;
import org.allbinary.graphics.paint.Paintable;

class FullScreenPaintableFactory {
    private static final instance : FullScreenPaintableFactory = new FullScreenPaintableFactory();
    public static function getInstance() : FullScreenPaintableFactory {
        return FullScreenPaintableFactory.instance;
    }

    public var paintable : Paintable = FullScreenPaintable.getInstance();
    public function new() {
    }
}

