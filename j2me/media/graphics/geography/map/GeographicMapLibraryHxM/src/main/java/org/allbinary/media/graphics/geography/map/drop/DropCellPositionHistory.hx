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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.graphics.CellPosition;
import org.allbinary.graphics.CellPositionFactory;
import org.allbinary.layer.AllBinaryLayer;

class DropCellPositionHistory {
    private static final SINGLETON : DropCellPositionHistory = new DropCellPositionHistory();
    public static function getInstance() : DropCellPositionHistory {
        return DropCellPositionHistory.SINGLETON;
    }

    private final cellPositionFactory : CellPositionFactory = CellPositionFactory.getInstance();
    private var positionList : BasicArrayList = new BasicArrayListD();
    private var layerList : BasicArrayList = new BasicArrayListD();
    public function add(cellPosition : CellPosition, layerInterface : AllBinaryLayer) : Void {
        this.positionList.add(cellPosition);
        this.layerList.add(layerInterface);
    }

    public function addAll(list : BasicArrayList, layerInterface : AllBinaryLayer) : Void {
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

    public function removeAll(layerInterface : AllBinaryLayer) : Void {
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

    public function getCellPositionWithDrop(list : BasicArrayList) : CellPosition {
        var cellPosition : CellPosition = null;
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            cellPosition = (cast list.get(index) : CellPosition);
            if (this.isCellPositionWithDrop(cellPosition)) {
                return cellPosition;
            }
                index--;
            }
        }
        return this.cellPositionFactory.NONE;
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

