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
package org.allbinary.media.graphics.geography.map.drop;

import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;

interface DropCellPositionGeneratorInterface {
    function getName() : String;

    // throws Exception
    function update(allBinaryGameLayerManager : AllBinaryGameLayerManager, geographicMapInterface : BasicGeographicMap) : Void;

    // throws Exception
    function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void;

    // throws Exception
    function isDropAllowedAt(geographicMapCellPosition : GeographicMapCellPosition) : Bool;

}

