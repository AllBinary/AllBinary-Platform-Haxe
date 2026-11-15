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

import org.allbinary.layer.Layer;
import org.allbinary.logic.communication.log.LogUtil;

class BasicGeographicMapUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : BasicGeographicMapUtil = new BasicGeographicMapUtil();
    public static function getInstance() : BasicGeographicMapUtil {
        return BasicGeographicMapUtil.instance;
    }

    // throws Exception
    public function getBorderingRow(direction : Int, oldGeographicMapCellPosition : GeographicMapCellPosition) : Int {
        final LOCATION_CHANGE : Int = 1;
        switch (direction) {
            case switchValue if (switchValue == 0):
                return oldGeographicMapCellPosition.getRow();
            case switchValue if (switchValue == 1):
                return oldGeographicMapCellPosition.getRow();
            case switchValue if (switchValue == 2):
                return oldGeographicMapCellPosition.getRow() + LOCATION_CHANGE;
            case switchValue if (switchValue == 3):
                return oldGeographicMapCellPosition.getRow() - LOCATION_CHANGE;
            default:
                throw new haxe.Exception("Only Four Directions");
        }
    }

    // throws Exception
    public function getBorderingColumn(direction : Int, oldGeographicMapCellPosition : GeographicMapCellPosition) : Int {
        final LOCATION_CHANGE : Int = 1;
        switch (direction) {
            case switchValue if (switchValue == 0):
                return oldGeographicMapCellPosition.getColumn() - LOCATION_CHANGE;
            case switchValue if (switchValue == 1):
                return oldGeographicMapCellPosition.getColumn() + LOCATION_CHANGE;
            case switchValue if (switchValue == 2):
                return oldGeographicMapCellPosition.getColumn();
            case switchValue if (switchValue == 3):
                return oldGeographicMapCellPosition.getColumn();
            default:
                throw new haxe.Exception("Only Four Directions");
        }
    }

    // throws Exception
    public function isSameCellPosition(fromGeographicMapCellPosition : GeographicMapCellPosition, toGeographicMapCellPosition : GeographicMapCellPosition) : Bool {
        final fromColumn : Int = fromGeographicMapCellPosition.getColumn();
        final fromRow : Int = fromGeographicMapCellPosition.getRow();
        final goColumn : Int = toGeographicMapCellPosition.getColumn();
        final goRow : Int = toGeographicMapCellPosition.getRow();
        if (fromColumn == goColumn && fromRow == goRow) {
            return true;
        } else {
            return false;
        }
    }

    public function createAllBinaryTiledLayerArray(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>) : haxe.ds.Vector<Layer> {
        final tiledLayerArray : haxe.ds.Vector<Layer> = haxe.ds.Vector.fromArrayCopy([for (index in 0...geographicMapInterfaceArray.length) null]);
        return this.getAllBinaryTiledLayerArray(geographicMapInterfaceArray, tiledLayerArray, 0);
    }

    public function getAllBinaryTiledLayerArray(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, tiledLayerArray : haxe.ds.Vector<Layer>, startIndex : Int) : haxe.ds.Vector<Layer> {
        var geographicMapInterface : BasicGeographicMap = null;
        final size : Int = geographicMapInterfaceArray.length;
        var count : Int = 0;
        {
            var index : Int = size + startIndex;
            while (--index >= startIndex) {
            geographicMapInterface = geographicMapInterfaceArray[index];
            tiledLayerArray[count++] = geographicMapInterface.getAllBinaryTiledLayer();
            }
        }
        return tiledLayerArray;
    }

    public function move(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, dx : Int, dy : Int) : Void {
        var geographicMapInterface : BasicGeographicMap = null;
        final size : Int = geographicMapInterfaceArray.length;
        {
            var index : Int = size;
            while (--index >= 0) {
            geographicMapInterface = geographicMapInterfaceArray[index];
            geographicMapInterface.getAllBinaryTiledLayer().moveDXY(dx, dy);
            }
        }
    }

    public function setPosition(geographicMapInterfaceArray : haxe.ds.Vector<BasicGeographicMap>, x : Int, y : Int) : Void {
        var geographicMapInterface : BasicGeographicMap = null;
        final size : Int = geographicMapInterfaceArray.length;
        {
            var index : Int = size;
            while (--index >= 0) {
            geographicMapInterface = geographicMapInterfaceArray[index];
            geographicMapInterface.getAllBinaryTiledLayer().setPosition(x, y, geographicMapInterface.getAllBinaryTiledLayer().getZP());
            }
        }
    }

    public function new() {
    }
}

