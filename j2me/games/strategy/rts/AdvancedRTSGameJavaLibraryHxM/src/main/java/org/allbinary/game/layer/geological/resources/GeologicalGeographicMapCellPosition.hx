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

import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;

class GeologicalGeographicMapCellPosition extends GeographicMapCellPosition {
    private final geologicalResource : GeologicalResource;
    public function new(column : Int, row : Int, columns : Int, rows : Int, width : Int, height : Int, geologicalResource : GeologicalResource) {
        super(column, row, columns, rows, width, height);
        this.geologicalResource = geologicalResource;
    }

    public function getGeologicalResource() : GeologicalResource {
        return this.geologicalResource;
    }

}

