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
package org.allbinary.media.graphics.geography.map.racetrack;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingNode;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInitVisitorInterface;
import org.allbinary.string.CommonSeps;

class BasePathFindingInfoFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    // throws Exception
    public function init(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : Void {
        // Java inner class: Haxe does not nest classes so move this to its own module
        class RaceTrackGeographicMapCellPositionFactoryInitVisitor implements GeographicMapCellPositionFactoryInitVisitorInterface {
            private var startLineId : Int;
            private var finishLineId : Int;
            public function new() {
                final raceTrackGeographicMapCellTypeFactory : GeographicMapCellTypeFactory = geographicMapInterface.getGeographicMapCellTypeFactory();
                this.startLineId = raceTrackGeographicMapCellTypeFactory.getStartType();
                this.finishLineId = raceTrackGeographicMapCellTypeFactory.getEndType();
            }

            // throws Exception
            public function visit(tiledLayer : AllBinaryTiledLayer, cellPosition : GeographicMapCellPosition) : Void {
                final row : Int = cellPosition.getRow();
                final column : Int = cellPosition.getColumn();
                try {
                    final cellTypeId : Int = mapArray[row][column];
                    final geographicCellType : Int = geographicMapInterface.getCellTypeFromMapCellTypeInt(cellTypeId);
                    if (geographicCellType == this.startLineId) {
                        this.addStartPathFindingNode(pathFindingInfo, cellPosition);
                    }
                    if (geographicCellType == this.finishLineId) {
                        if (geographicCellType == this.startLineId) {
                            this.addEndPathFindingNode(pathFindingInfo, geographicMapInterface.getGeographicMapCellPositionFactoryInterface().getInstance(geographicMapInterface, cellPosition.getColumn(), cellPosition.getRow(), tiledLayer.getColumns(), tiledLayer.getRows(), tiledLayer.getCellWidth(), tiledLayer.getCellHeight()));
                        } else {
                            this.addEndPathFindingNode(pathFindingInfo, cellPosition);
                        }
                    }
                    final raceTrackGeographicMapCellTypeFactory : GeographicMapCellTypeFactory = geographicMapInterface.getGeographicMapCellTypeFactory();
                    final geographicMapCellTypeFactory : GeographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance();
                    if (raceTrackGeographicMapCellTypeFactory.isPath(geographicMapCellTypeFactory.get(geographicCellType))) {
                        RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance().track(cellPosition);
                    } else {
                    }
                } catch (e : haxe.Exception) {
                    final commonSeps : CommonSeps = CommonSeps.getInstance();
                    logUtil.put(new StringMaker().append(commonSeps.BRACKET_OPEN).appendint(row).append(commonSeps.BRACKET_CLOSE).append(commonSeps.BRACKET_OPEN).appendint(column).append("] in [").appendint(mapArray.length).append(commonSeps.BRACKET_CLOSE).append(commonSeps.BRACKET_OPEN).appendint(mapArray[0].length).append(commonSeps.BRACKET_CLOSE).toString(), this, "visit", e);
                    throw e;
                }
            }

        }
        geographicMapInterface.getGeographicMapCellPositionFactory().visit(new RaceTrackGeographicMapCellPositionFactoryInitVisitor());
    }

    // throws Exception
    private function addStartPathFindingNode(pathFindingInfo : PathFindingInfo, startGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        pathFindingInfo.addStartPathFindingNode(new PathFindingNode(NullUtil.getInstance().NULL_OBJECT, startGeographicMapCellPosition));
    }

    // throws Exception
    private function addEndPathFindingNode(pathFindingInfo : PathFindingInfo, endGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        pathFindingInfo.addEndPathFindingNode(new PathFindingNode(NullUtil.getInstance().NULL_OBJECT, endGeographicMapCellPosition));
    }

    // throws Exception
    public function getInstancePathFindingInfo(geographicMapInterface : BasicGeographicMap, graphArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : PathFindingInfo {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

