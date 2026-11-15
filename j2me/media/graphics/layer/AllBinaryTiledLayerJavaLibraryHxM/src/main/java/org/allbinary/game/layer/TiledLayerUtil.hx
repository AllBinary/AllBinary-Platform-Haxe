/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer;


class TiledLayerUtil {
    private static final instance : TiledLayerUtil = new TiledLayerUtil();
    public static function getInstance() : TiledLayerUtil {
        return TiledLayerUtil.instance;
    }

    public function keepOnBorderdMapX(terrainTiledLayer : AllBinaryTiledLayer, x : Int, width : Int, mapBorderBufferWidth : Int) : Int {
        var newX : Int = x;
        var maxRight : Int = terrainTiledLayer.getWidth() - width - mapBorderBufferWidth;
        if (x + width > maxRight) {
            newX = maxRight;
        }
        if (x < mapBorderBufferWidth) {
            newX = mapBorderBufferWidth;
        }
        return newX;
    }

    public function keepOnBorderdMapY(terrainTiledLayer : AllBinaryTiledLayer, y : Int, height : Int, mapBorderBufferHeight : Int) : Int {
        var newY : Int = y;
        var maxBottom : Int = terrainTiledLayer.getHeight() - height - mapBorderBufferHeight;
        if (y + height > maxBottom) {
            newY = maxBottom;
        }
        if (y < mapBorderBufferHeight) {
            newY = mapBorderBufferHeight;
        }
        return newY;
    }

    public function keepOnMapX(terrainTiledLayer : AllBinaryTiledLayer, x : Int, width : Int) : Int {
        var newX : Int = x;
        var maxRight : Int = terrainTiledLayer.getWidth() - width;
        if (x >= maxRight) {
            newX = maxRight;
        }
        if (x < 0) {
            newX = 0;
        }
        return newX;
    }

    public function keepOnMapY(terrainTiledLayer : AllBinaryTiledLayer, y : Int, height : Int) : Int {
        var newY : Int = y;
        var maxBottom : Int = terrainTiledLayer.getHeight() - height;
        if (y >= maxBottom) {
            newY = maxBottom;
        }
        if (y < 0) {
            newY = 0;
        }
        return newY;
    }

    public function new() {
    }
}

