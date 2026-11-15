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
package org.allbinary.game.input.form;

//import javax.microedition.lcdui.game.SimpleTiledLayer;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.game.layer.building.event.BuildingEventListenerInterface;
import org.allbinary.game.layer.building.event.LocalPlayerBuildingEventHandler;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.graphics.CellPosition;
import org.allbinary.layer.event.ScrollMapEvent;
import org.allbinary.layer.event.ScrollMapEventHandler;
import org.allbinary.layer.event.ScrollMapEventListenerInterface;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;

class VisibleCellPositionsSingleton implements BuildingEventListenerInterface implements ScrollMapEventListenerInterface {
    private static final instance : VisibleCellPositionsSingleton = new VisibleCellPositionsSingleton();
    public static function getInstance() : VisibleCellPositionsSingleton {
        return VisibleCellPositionsSingleton.instance;
    }

    private var stationaryVisibleCellPositions : haxe.ds.Vector<haxe.ds.Vector<Int>> = NullUtil.getInstance().NULL_SHORT_ARRAY_ARRAY;
    private var visibleCellPositions : haxe.ds.Vector<haxe.ds.Vector<Int>> = NullUtil.getInstance().NULL_SHORT_ARRAY_ARRAY;
    private var currentlyVisibleCellPositions : haxe.ds.Vector<haxe.ds.Vector<Int>> = NullUtil.getInstance().NULL_SHORT_ARRAY_ARRAY;
    public final ALL_VISIBLE_TILEDLAYER : SimpleTiledLayer = new SimpleTiledLayer(0, 0, 0, 0);
    private var simpleTiledLayer : SimpleTiledLayer = this.ALL_VISIBLE_TILEDLAYER;
    private var paintSimpleTiledLayer : SimpleTiledLayer = this.ALL_VISIBLE_TILEDLAYER;
    private var currentIndex : Int = 0;
    public function new() {
        LocalPlayerBuildingEventHandler.getInstance().addListenerInterface(this);
        ScrollMapEventHandler.getInstance().addListenerInterface(this);
    }

    public function init(simpleTiledLayer : SimpleTiledLayer) : Void {
        this.paintSimpleTiledLayer = this.ALL_VISIBLE_TILEDLAYER;
        this.currentIndex = 0;
        var rows : Int = simpleTiledLayer.getRows();
        var columns : Int = simpleTiledLayer.getColumns();
        this.stationaryVisibleCellPositions = haxe.ds.Vector.fromArrayCopy([for (index in 0...rows) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...columns) 0])]);
        this.visibleCellPositions = haxe.ds.Vector.fromArrayCopy([for (index in 0...rows) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...columns) 0])]);
        this.currentlyVisibleCellPositions = haxe.ds.Vector.fromArrayCopy([for (index in 0...rows) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...columns) 0])]);
        this.setSimpleTiledLayer(simpleTiledLayer);
    }

    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    // throws Exception
    public function onBuildingEvent(event : RTSLayerEvent) : Void {
        this.paintSimpleTiledLayer = this.simpleTiledLayer;
    }

    // throws Exception
    public function onMoveEvent(scrollMapEvent : ScrollMapEvent) : Void {
        this.move(scrollMapEvent.getDx(), scrollMapEvent.getDy());
    }

    public function addStationaryCellPositions(list : BasicArrayList) : Void {
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            var cellPosition : CellPosition = (cast list.get(index) : CellPosition);
            this.stationaryVisibleCellPositions[cellPosition.getRow()][cellPosition.getColumn()]++;
                index--;
            }
        }
    }

    public function removeStationaryCellPositions(list : BasicArrayList) : Void {
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            var cellPosition : CellPosition = (cast list.get(index) : CellPosition);
            this.stationaryVisibleCellPositions[cellPosition.getRow()][cellPosition.getColumn()]--;
                index--;
            }
        }
    }

    public function update() : Void {
        if (this.currentIndex == 0) {
            final temp : haxe.ds.Vector<haxe.ds.Vector<Int>> = this.currentlyVisibleCellPositions;
            this.currentlyVisibleCellPositions = this.visibleCellPositions;
            this.visibleCellPositions = temp;
            {
                var index : Int = this.visibleCellPositions.length - 1;
                while (index >= 0) {
                {
                    var index2 : Int = this.visibleCellPositions[0].length - 1;
                    while (index2 >= 0) {
                    this.visibleCellPositions[index][index2] = this.stationaryVisibleCellPositions[index][index2];
                        index2--;
                    }
                }
                    index--;
                }
            }
        }
        this.currentIndex++;
        if (this.currentIndex > 10) {
            this.currentIndex = 0;
        }
    }

    public function shouldProcess() : Bool {
        if (this.currentIndex == 0) {
            return true;
        } else {
            return false;
        }
    }

    public function addCellPositions(list : BasicArrayList) : Void {
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            var cellPosition : CellPosition = (cast list.get(index) : CellPosition);
            this.visibleCellPositions[cellPosition.getRow()][cellPosition.getColumn()]++;
                index--;
            }
        }
    }

    public function isVisible(cellPosition : CellPosition) : Bool {
        if (this.visibleCellPositions[cellPosition.getRow()][cellPosition.getColumn()] > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function move(dx : Int, dy : Int) : Void {
        this.getSimpleTiledLayer().moveDXY(dx, dy);
    }

    public function paint(graphics : Graphics) : Void {
        this.paintSimpleTiledLayer.paint(graphics, this.currentlyVisibleCellPositions);
    }

    private function setSimpleTiledLayer(simpleTiledLayer : SimpleTiledLayer) : Void {
        this.simpleTiledLayer = simpleTiledLayer;
    }

    public function getSimpleTiledLayer() : SimpleTiledLayer {
        return this.simpleTiledLayer;
    }

}

