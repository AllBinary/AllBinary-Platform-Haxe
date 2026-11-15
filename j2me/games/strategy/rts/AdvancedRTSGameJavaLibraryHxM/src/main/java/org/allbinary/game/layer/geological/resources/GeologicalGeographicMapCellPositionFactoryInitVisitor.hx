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
package org.allbinary.game.layer.geological.resources;

import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInitVisitorInterface;

class GeologicalGeographicMapCellPositionFactoryInitVisitor implements GeographicMapCellPositionFactoryInitVisitorInterface {
    // throws Exception
    public function visit(tiledLayer : AllBinaryTiledLayer, cellPosition : GeographicMapCellPosition) : Void {
        final geologicalGeographicMapCellPosition : GeologicalGeographicMapCellPosition = ((cast cellPosition : GeologicalGeographicMapCellPosition));
        geologicalGeographicMapCellPosition.getGeologicalResource().init();
    }

    public function new() {
    }
}

