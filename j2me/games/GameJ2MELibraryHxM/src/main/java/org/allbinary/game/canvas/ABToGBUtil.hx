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
package org.allbinary.game.canvas;

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.NullCanvas;
import org.allbinary.game.layer.AllBinaryGameLayerManager;

class ABToGBUtil {
    private static final instance : ABToGBUtil = new ABToGBUtil();
    public static function getInstance() : ABToGBUtil {
        return ABToGBUtil.instance;
    }

    public var abCanvas : Canvas = NullCanvas.NULL_CANVAS;
    public var allBinaryGameLayerManager : AllBinaryGameLayerManager = AllBinaryGameLayerManager.getNullInstance();
    public function new() {
    }
}

