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
package org.allbinary.game.behavior.topview.placement;

import org.mapeditor.core.TiledMap;

class AllAnimationsEverywhereTileMapPlacementVisitor extends TileMapPlacementVisitor {
    public override function visit(lastMap : TiledMap, mapData : haxe.ds.Vector<haxe.ds.Vector<Int>>) : Void {
        final size : Int = mapData.length;
        final size2 : Int = mapData[0].length - 7;
        for (index in 0...size) {
            {
                var index2 : Int = 0;
                while (index2 < size2) {
                mapData[index][index2] = 1;
                mapData[index][index2 + 1] = 17;
                mapData[index][index2 + 2] = 33;
                mapData[index][index2 + 3] = 49;
                mapData[index][index2 + 4] = 65;
                mapData[index][index2 + 5] = 81;
                mapData[index][index2 + 6] = 97;
                    index2 += 7;
                }
            }
        }
    }

    public function new() {
        super();
    }
}

