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


class FinalPositionRaceTrackFactory {
    public static final FIRST_POSITION : Int = 1;
    private static var index : Int = FinalPositionRaceTrackFactory.FIRST_POSITION;
    public function new() {
    }

    // synchronized
    public static function getInstance() : Int {
        return FinalPositionRaceTrackFactory.index++;
    }

    // synchronized
    public static function reset() : Void {
        FinalPositionRaceTrackFactory.index = FinalPositionRaceTrackFactory.FIRST_POSITION;
    }

}

