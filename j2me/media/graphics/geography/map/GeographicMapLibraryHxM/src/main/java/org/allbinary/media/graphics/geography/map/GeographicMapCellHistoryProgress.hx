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

import org.allbinary.logic.NullUtil;

class GeographicMapCellHistoryProgress extends GeographicMapCellHistoryProgressBase {
    private var totalVisitedArray : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_INT_ARRAY;
    private var geographicMapCellHistoryArray : haxe.ds.Vector<GeographicMapCellHistory> = GeographicMapCellHistory.NULL_GEOGRPAHIC_MAP_HISTORY_ARRAY;
    public function new(geographicMapCellHistoryArray : haxe.ds.Vector<GeographicMapCellHistory>) {
        super();
        this.geographicMapCellHistoryArray = geographicMapCellHistoryArray;
        this.init();
    }

    public override function init() : Void {
        this.totalVisitedArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.geographicMapCellHistoryArray.length) 0]);
    }

    public override function isAnyProgress() : Bool {
        var isProgressing : Bool = false;
        var size : Int = this.geographicMapCellHistoryArray.length;
        var currentTotalVisited : Int = 0;
        var totalVisited : Int = 0;
        for (index in 0...size) {
            totalVisited = this.geographicMapCellHistoryArray[index].getTotalVisited();
            currentTotalVisited = this.totalVisitedArray[index];
            if (currentTotalVisited < totalVisited) {
                isProgressing = true;
                this.totalVisitedArray[index] = totalVisited;
            }
        }
        return isProgressing;
    }

}

