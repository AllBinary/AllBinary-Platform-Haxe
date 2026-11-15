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
package org.allbinary.media.graphics.geography.map.racetrack.drop;

import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.drop.DropLayerFactory;
import org.allbinary.game.layer.pickup.PickupLayerCircularStaticPool;
import org.allbinary.game.layer.pickup.RaceTrackPickupLayer;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.graphics.GPoint;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;

class RaceTrackRandomDropCellPositionGenerator extends RaceTrackDropCellPositionGenerator {
    private static var SINGLETON : RaceTrackRandomDropCellPositionGenerator = new RaceTrackRandomDropCellPositionGenerator();
    public static function getInstance() : RaceTrackRandomDropCellPositionGenerator {
        return RaceTrackRandomDropCellPositionGenerator.SINGLETON;
    }

    private final myRandomFactory : MyRandomFactory = MyRandomFactory.getInstance();
    private final cellsPerRowOrColumn : Int = 3;
    private final totalCells : Int = this.cellsPerRowOrColumn * this.cellsPerRowOrColumn;
    private final rowArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([0, 1, 2, 0, 1, 2, 0, 1, 2]);
    private final columnArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([0, 0, 0, 1, 1, 1, 2, 2, 2]);
    private var cellWidth : Int = 0;
    private var cellHeight : Int = 0;
    public function new() {
        super();
    }

    // throws Exception
    public override function update(allBinaryGameLayerManager : AllBinaryGameLayerManager, geographicMapInterface : BasicGeographicMap) : Void {
        super.update(allBinaryGameLayerManager, geographicMapInterface);
        var tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        this.cellWidth = tiledLayer.getCellWidth() / this.cellsPerRowOrColumn;
        this.cellHeight = tiledLayer.getCellHeight() / this.cellsPerRowOrColumn;
    }

    // throws Exception
    public override function drop(allBinaryLayerManager : AllBinaryLayerManager, index : Int) : Void {
        var geographicMapCellPosition : GeographicMapCellPosition = (cast this.list.get(index) : GeographicMapCellPosition);
        var point : GPoint = geographicMapCellPosition.getPoint();
        var randomCell : Int = this.myRandomFactory.getAbsoluteNextInt(this.totalCells);
        var row : Int = this.rowArray[randomCell];
        var column : Int = this.columnArray[randomCell];
        var x : Int = point.getX() + (row * this.cellWidth);
        var y : Int = point.getY() + (column * this.cellHeight);
        var pickedUpLayerInterfaceFactory : PickedUpLayerInterfaceFactoryInterface = DropLayerFactory.getInstance().getRandomInstance();
        var tiledLayer : AllBinaryTiledLayer = this.raceTrackGeographicMap.getAllBinaryTiledLayer();
        var pickupLayer : RaceTrackPickupLayer = (cast PickupLayerCircularStaticPool.getInstance().getInstanceXYZ(pickedUpLayerInterfaceFactory, x, y, tiledLayer.getZP() + 3) : RaceTrackPickupLayer);
        pickupLayer.setTiledLayer(tiledLayer);
        allBinaryLayerManager.append(pickupLayer);
    }

}

