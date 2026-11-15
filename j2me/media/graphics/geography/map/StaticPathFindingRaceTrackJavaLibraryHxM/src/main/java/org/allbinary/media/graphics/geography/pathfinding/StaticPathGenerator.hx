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
package org.allbinary.media.graphics.geography.pathfinding;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.graphics.CellPosition;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.PathData;
import org.allbinary.util.BasicArrayListUtil;

class StaticPathGenerator implements PathGeneratorInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    public function new() {
        PreLogUtil.put("Using Static Path Finding", this, CommonStrings.getInstance().CONSTRUCTOR);
    }

    // throws Exception
    public function init(geographicMapInterface : Any, totalPaths : Int) : Void {
    }

    // throws Exception
    private function getGeographicMapCellPositionListFromBasicGeographicMapCellPositionList(geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory, pathList : BasicArrayList) : BasicArrayList {
        final list : BasicArrayList = new BasicArrayListD();
        final size : Int = pathList.size();
        var basicGeographicMapCellPosition : CellPosition = null;
        var geographicMapCellPosition : GeographicMapCellPosition = null;
        for (index in 0...size) {
            basicGeographicMapCellPosition = (cast pathList.get(index) : CellPosition);
            geographicMapCellPosition = geographicMapCellPositionFactory.getAt(basicGeographicMapCellPosition.getColumn(), basicGeographicMapCellPosition.getRow());
            list.add(geographicMapCellPosition);
        }
        return list;
    }

    // throws Exception
    public function createList(geographicMapInterface : BasicGeographicMap, geographicMapCellHistory : GeographicMapCellHistory, pathFindingInfo : PathFindingInfo, totalPaths : Int) : BasicArrayList {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            final pathCacheFactory : PathCacheFactory = PathCacheFactory.getInstance();
            final mapIdInteger : Null<Int> = geographicMapInterface.getAllBinaryTiledLayer().getDataId();
            var list : BasicArrayList = pathCacheFactory.getOrCreate(mapIdInteger);
            if (list == this.basicArrayListUtil.getImmutableInstance()) {
                list = new BasicArrayListD();
                final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
                final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
                final id : Int = PathData.getInstance().OFFSET + Std.int(mapIdInteger);
                final basicList : BasicArrayList = pathCacheFactory.getOrCreate(smallIntegerSingletonFactory.getAt(id));
                final size : Int = basicList.size();
                var pathList : BasicArrayList = null;
                for (index in 0...size) {
                    pathList = this.getGeographicMapCellPositionListFromBasicGeographicMapCellPositionList(geographicMapCellPositionFactory, (cast basicList.get(index) : BasicArrayList));
                    list.add(pathList);
                }
                pathCacheFactory.add(mapIdInteger, list);
                pathCacheFactory.remove(smallIntegerSingletonFactory.getAt(id));
            }
            this.logUtil.putF(new StringMaker().append("Using Cached Path(s): ").append(StringUtil.getInstance().toString(list)).toString(), this, commonStrings.GET_INSTANCE);
            return list;
        } catch (e : haxe.Exception) {
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            return new BasicArrayListD();
        }
    }

}

