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
package org.allbinary.game.behavior.topview;

import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;

interface TopViewCharacterInterface {
    function terrainMove(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, x : Int, y : Int) : Void;

    // throws Exception
    function terrainEvent(x : Int, y : Int, geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType>, geographicMapCellPosition : GeographicMapCellPosition) : Void;

    function move() : Void;

    function upp() : Void;

    function leftp() : Void;

    function rightp() : Void;

    // throws Exception
    function reset() : Void;

}

