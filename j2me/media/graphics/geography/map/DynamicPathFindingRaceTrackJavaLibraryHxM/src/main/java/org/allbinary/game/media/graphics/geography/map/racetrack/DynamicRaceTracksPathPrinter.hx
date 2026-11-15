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
package org.allbinary.game.media.graphics.geography.map.racetrack;

import org.allbinary.util.BasicArrayList;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapInterfaceFactoryInterface;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTracksPathPrinter;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo;
import org.allbinary.media.graphics.geography.pathfinding.PathGenerator;

class DynamicRaceTracksPathPrinter extends RaceTracksPathPrinter {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function printAllPaths(raceTrackGeographicMapInterfaceFactoryInterface : RaceTrackGeographicMapInterfaceFactoryInterface, pathFindingInfo : PathFindingInfo, size : Int) : Void {
        try {
            for (index in 0...size) {
                var geographicMapInterface : BasicGeographicMap = raceTrackGeographicMapInterfaceFactoryInterface.getTrackInstance(SmallIntegerSingletonFactory.getInstance().getAt(index));
                var list : BasicArrayList = PathGenerator.getInstance().createList(geographicMapInterface, RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance(), pathFindingInfo, 10);
                trace("Track " + index);
                this.printPaths(list);
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
        }
    }

    public function new() {
        super();
    }
}

