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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.map.drop.BaseDropCellPositionGenerator;
import org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap;
import org.allbinary.media.graphics.geography.map.racetrack.NullRaceTrackGeographicMap;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapInterface;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;

class RaceTrackDropCellPositionGenerator extends BaseDropCellPositionGenerator {
    public final list : BasicArrayList = new BasicArrayListD();
    private final timeDelayHelper : TimeDelayHelper;
    private final STRAIGHTAWAY : Int = 4;
    public var raceTrackGeographicMap : RaceTrackGeographicMapInterface = NullRaceTrackGeographicMap.NULL_RACE_TRACK_GEOGRAPHIC_MAP;
    public var raceTrackGeographicMapCellTypeFactory : GeographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance();
    public function new() {
        super();
        this.timeDelayHelper = new TimeDelayHelper(10000);
    }

    private function init() : Void {
        this.list.clear();
    }

    // throws Exception
    public override function isDropAllowedAt(geographicMapCellPosition : GeographicMapCellPosition) : Bool {
        final raceTrackGeographicMapCellType : RaceTrackGeographicMapCellType = (cast this.raceTrackGeographicMap.getCellTypeAt(geographicMapCellPosition) : RaceTrackGeographicMapCellType);
        final raceTrackGeographicMapCellTypeFactory : RaceTrackGeographicMapCellTypeFactory = (cast this.raceTrackGeographicMapCellTypeFactory : RaceTrackGeographicMapCellTypeFactory);
        if (raceTrackGeographicMapCellType == raceTrackGeographicMapCellTypeFactory.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE || raceTrackGeographicMapCellType == raceTrackGeographicMapCellTypeFactory.VERTICAL_STRAIGHT_ROAD_CELL_TYPE) {
            return true;
        }
        return false;
    }

    // throws Exception
    public override function update(allBinaryGameLayerManager : AllBinaryGameLayerManager, geographicMapInterface : BasicGeographicMap) : Void {
        this.init();
        final baseRaceTrackGeographicMap : BaseRaceTrackGeographicMap = (cast geographicMapInterface : BaseRaceTrackGeographicMap);
        this.raceTrackGeographicMap = baseRaceTrackGeographicMap;
        this.raceTrackGeographicMapCellTypeFactory = (cast baseRaceTrackGeographicMap.getGeographicMapCellTypeFactory() : RaceTrackGeographicMapCellTypeFactory);
        final roadGeographicMapCellHistory : GeographicMapCellHistory = RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance();
        final trackedList : BasicArrayList = roadGeographicMapCellHistory.getTracked();
        var geographicMapCellPosition : GeographicMapCellPosition = null;
        final lastIndex : Int = trackedList.size() - 1;
        var total : Int = 0;
        var ahead : Int = 0;
        {
            var index : Int = lastIndex;
            while (index > 0) {
            geographicMapCellPosition = (cast trackedList.get(index) : GeographicMapCellPosition);
            total = 0;
            ahead = index;
            while (this.isDropAllowedAt((cast trackedList.get(ahead) : GeographicMapCellPosition))) {
                total++;
                if (total > this.STRAIGHTAWAY) {
                    this.list.add(geographicMapCellPosition);
                    break;
                }
                ahead++;
                if (ahead > lastIndex) {
                    break;
                }
            }
                index--;
            }
        }
        var size : Int = this.list.size();
        {
            var index : Int = size - 1;
            while (index >= 0) {
            this.drop(allBinaryGameLayerManager, index);
                index--;
            }
        }
    }

    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    // throws Exception
    public override function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.timeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().startTime)) {
            var index : Int = this.basicArrayListUtil.getRandomIndex(this.list);
            this.drop(allBinaryLayerManager, index);
        }
    }

    // throws Exception
    public function drop(allBinaryLayerManager : AllBinaryLayerManager, index : Int) : Void {
        throw new haxe.Exception(CommonStrings.getInstance().NOT_IMPLEMENTED);
    }

}

