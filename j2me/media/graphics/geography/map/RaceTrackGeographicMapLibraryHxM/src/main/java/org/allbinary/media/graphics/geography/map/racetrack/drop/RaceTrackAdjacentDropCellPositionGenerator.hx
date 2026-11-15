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

import org.allbinary.game.identification.GroupCommonFactory;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.game.identification.BasicGroupFactory;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.geographic.map.LayerCoveringCellPositionsUtil;
import org.allbinary.graphics.GPoint;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.StdUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionGeneratorInterface;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;
import org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory;
import org.allbinary.util.ABHashtable;

class RaceTrackAdjacentDropCellPositionGenerator extends RaceTrackDropCellPositionGenerator {
    private static var SINGLETON : RaceTrackAdjacentDropCellPositionGenerator = new RaceTrackAdjacentDropCellPositionGenerator();
    public static function getInstance() : DropCellPositionGeneratorInterface {
        return RaceTrackAdjacentDropCellPositionGenerator.SINGLETON;
    }

    private final layerCoveringCellPositionsUtil : LayerCoveringCellPositionsUtil = LayerCoveringCellPositionsUtil.getInstance();
    private final groupCommonFactory : GroupCommonFactory = GroupCommonFactory.getInstance();
    private var surroundingCellPositions : haxe.ds.Vector<GeographicMapCellPosition> = haxe.ds.Vector.fromArrayCopy([for (index in 0...4) null]);
    public function new() {
        super();
    }

    // throws Exception
    private function getFirstNonRoadAdjacentCellPosition(column : Int, row : Int) : GeographicMapCellPosition {
        var nonRoadGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = this.raceTrackGeographicMap.getGeographicMapCellPositionFactory();
        this.surroundingCellPositions[0] = geographicMapCellPositionFactory.getAt(column, row - 1);
        this.surroundingCellPositions[1] = geographicMapCellPositionFactory.getAt(column, row + 1);
        this.surroundingCellPositions[2] = geographicMapCellPositionFactory.getAt(column - 1, row);
        this.surroundingCellPositions[3] = geographicMapCellPositionFactory.getAt(column + 1, row);
        final baseRaceTrackGeographicMap : BaseRaceTrackGeographicMap = (cast this.raceTrackGeographicMap : BaseRaceTrackGeographicMap);
        final raceTrackGeographicMapCellTypeFactory : RaceTrackGeographicMapCellTypeFactory = (cast baseRaceTrackGeographicMap.getGeographicMapCellTypeFactory() : RaceTrackGeographicMapCellTypeFactory);
        var geographicMapCellPosition : GeographicMapCellPosition = null;
        var raceTrackGeographicMapCellType : RaceTrackGeographicMapCellType = null;
        {
            var index : Int = this.surroundingCellPositions.length;
            while (--index >= 0) {
            geographicMapCellPosition = this.surroundingCellPositions[index];
            raceTrackGeographicMapCellType = (cast this.raceTrackGeographicMap.getCellTypeAt(geographicMapCellPosition) : RaceTrackGeographicMapCellType);
            if (!raceTrackGeographicMapCellTypeFactory.isPath(raceTrackGeographicMapCellType)) {
                nonRoadGeographicMapCellPosition = geographicMapCellPosition;
                break;
            }
            }
        }
        return nonRoadGeographicMapCellPosition;
    }

    private final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    // throws Exception
    public override function update(allBinaryGameLayerManager : AllBinaryGameLayerManager, geographicMapInterface : BasicGeographicMap) : Void {
        this.hashtable.put(AllBinaryGameLayerManager.ID, allBinaryGameLayerManager);
        super.update(allBinaryGameLayerManager, geographicMapInterface);
    }

    private final geographicMapDirectionUtil : GeographicMapDirectionUtil = GeographicMapDirectionUtil.getInstance();
    // throws Exception
    public override function drop(allBinaryLayerManager : AllBinaryLayerManager, index : Int) : Void {
        final geographicMapCellPosition : GeographicMapCellPosition = (cast this.list.get(index) : GeographicMapCellPosition);
        final randomGeographicMapCellPosition : GeographicMapCellPosition = this.getFirstNonRoadAdjacentCellPosition(geographicMapCellPosition.getColumn(), geographicMapCellPosition.getRow());
        if (randomGeographicMapCellPosition == null) {
            return;
        }
        final dropCellPositionHistory : DropCellPositionHistory = DropCellPositionHistory.getInstance();
        if (!dropCellPositionHistory.isCellPositionWithDrop(geographicMapCellPosition)) {
            final direction : Direction = this.geographicMapDirectionUtil.getDirectionFromCellPositionToAdjacentCellPosition(randomGeographicMapCellPosition, geographicMapCellPosition);
            final objectCanBeNull : Any = this.hashtable.get(this.groupCommonFactory.ID);
            if (objectCanBeNull != null) {
            } else {
                this.hashtable.put(this.groupCommonFactory.ID, BasicGroupFactory.getInstance().NONE_ARRAY);
            }
            this.hashtable.put(DirectionFactory.getInstance().NAME, direction);
            final point : GPoint = randomGeographicMapCellPosition.getPoint();
            final x : Int = point.getX();
            final y : Int = point.getY();
            final z : Int = point.getZ();
            final layerInterface : AllBinaryLayer = RaceTrackAdjacentDropLayerFactory.getInstance().getRandomInstance().getNextInstance(hashtable, x, y, z);
            final baseRaceTrackGeographicMap : BaseRaceTrackGeographicMap = (cast this.raceTrackGeographicMap : BaseRaceTrackGeographicMap);
            final list : BasicArrayList = this.layerCoveringCellPositionsUtil.getAll(baseRaceTrackGeographicMap, randomGeographicMapCellPosition, layerInterface, new BasicArrayListD());
            if (dropCellPositionHistory.anyCellPositionWithDrop(list)) {
                return;
            }
            var geographicMapCellType : GeographicMapCellType = null;
            {
                var index2 : Int = list.size();
                while (--index2 >= 0) {
                geographicMapCellType = this.raceTrackGeographicMap.getCellTypeAt((cast list.get(index2) : GeographicMapCellPosition));
                if (this.raceTrackGeographicMapCellTypeFactory.isPath(geographicMapCellType)) {
                    return;
                }
                }
            }
            dropCellPositionHistory.addAll(list, layerInterface);
            allBinaryLayerManager.append(layerInterface);
        }
    }

}

