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

import org.allbinary.string.CommonStrings;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;

class RaceTrackGeographicMapCellType extends GeographicMapCellType {
    public final name : String;
    private final travelCost : Int;
    public function new(name : String, type : Int, travelCost : Int, reset : Int) {
        super(type, reset);
        this.name = name;
        this.travelCost = travelCost;
    }

    public function getTravelCost() : Int {
        return this.travelCost;
    }

}

