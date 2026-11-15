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
package org.allbinary.game.layer.waypoint;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.graphics.CellPosition;
import org.allbinary.layer.AllBinaryLayer;

class WaypointCellPositionHistory {
    private static final SINGLETON : WaypointCellPositionHistory = new WaypointCellPositionHistory();
    public static function getInstance() : WaypointCellPositionHistory {
        return WaypointCellPositionHistory.SINGLETON;
    }

    private var positionList : BasicArrayList = new BasicArrayListD();
    private var layerList : BasicArrayList = new BasicArrayListD();
    public function add(cellPosition : CellPosition, layerInterface : AllBinaryLayer) : Void {
        this.positionList.add(cellPosition);
        this.layerList.add(layerInterface);
    }

    public function addList(list : BasicArrayList, layerInterface : AllBinaryLayer) : Void {
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            this.add((cast list.get(index) : CellPosition), layerInterface);
                index--;
            }
        }
    }

    public function remove(cellPosition : CellPosition) : Void {
        var index : Int = this.positionList.indexOf(cellPosition);
        if (index >= 0) {
            this.positionList.removeAt(index);
            this.layerList.removeAt(index);
        }
    }

    public function removeLayer(layerInterface : AllBinaryLayer) : Void {
        var index : Int = 0;
        while (index != -1) {
            index = this.layerList.indexOf(layerInterface);
            if (index >= 0) {
                this.positionList.removeAt(index);
                this.layerList.removeAt(index);
            }
        }
    }

    public function clear() : Void {
        this.positionList.clear();
        this.layerList.clear();
    }

    public function isCellPositionWithDrop(cellPosition : CellPosition) : Bool {
        return this.positionList.contains(cellPosition);
    }

    public function anyCellPositionWithDrop(list : BasicArrayList) : Bool {
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            if (this.isCellPositionWithDrop((cast list.get(index) : CellPosition))) {
                return true;
            }
                index--;
            }
        }
        return false;
    }

    public function getLayerInterface(cellPosition : CellPosition) : AllBinaryLayer {
        var index : Int = this.positionList.indexOf(cellPosition);
        if (index >= 0) {
            return (cast this.layerList.get(index) : AllBinaryLayer);
        } else {
            return AllBinaryLayer.NULL_ALLBINARY_LAYER;
        }
    }

    public function new() {
    }
}

