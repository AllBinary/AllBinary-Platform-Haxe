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
package org.allbinary.media.graphics.geography.map;

import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.layer.Layer;

interface GeographicMapInterface {
    function getId() : Null<Int>;

    function getName() : String;

    function reset() : Void;

    function getAllBinaryTiledLayer() : AllBinaryTiledLayer;

    // throws Exception
    function getCellPositionsAt(layer : Layer, currentCellPositionArray : haxe.ds.Vector<haxe.ds.Vector<GeographicMapCellPosition>>, cellPositionArray : haxe.ds.Vector<haxe.ds.Vector<GeographicMapCellPosition>>) : Bool;

    // throws Exception
    function getCellPositionAtXY(x : Int, y : Int) : GeographicMapCellPosition;

    // throws Exception
    function getCellPositionAtXYNoThrow(x : Int, y : Int) : GeographicMapCellPosition;

    function getCellTypeFromMapCellTypeInt(cellTypeId : Int) : Int;

    // throws Exception
    function getCellTypeAtXY(x : Int, y : Int) : GeographicMapCellType;

    // throws Exception
    function getCellTypeAt(geographicMapCellPosition : GeographicMapCellPosition) : GeographicMapCellType;

    function getGeographicMapCellPositionFactory() : BasicGeographicMapCellPositionFactory;

    function getGeographicMapCellPositionFactoryInterface() : GeographicMapCellPositionFactoryInterface;

    function getForegroundBasicColor() : BasicColor;

    function getBackgroundBasicColor() : BasicColor;

}

