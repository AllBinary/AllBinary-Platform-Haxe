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

import org.allbinary.game.physics.friction.FrictionData;

class RaceTrackFrictionProperties {
    private final ROAD_FRICTION_NOMINATOR : Int;
    private final GROUND_FRICTION_NOMINATOR : Int;
    public function new(roadFriction : Int, groundFriction : Int) {
        this.ROAD_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - roadFriction;
        this.GROUND_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - groundFriction;
    }

    public function getRoadFrictionNominator() : Int {
        return this.ROAD_FRICTION_NOMINATOR;
    }

    public function getGroundFrictionNominator() : Int {
        return this.GROUND_FRICTION_NOMINATOR;
    }

}

