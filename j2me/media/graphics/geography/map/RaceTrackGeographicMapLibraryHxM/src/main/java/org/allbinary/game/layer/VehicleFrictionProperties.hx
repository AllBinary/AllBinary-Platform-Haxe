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
package org.allbinary.game.layer;

import org.allbinary.game.physics.FrictionProperties;
import org.allbinary.game.physics.friction.FrictionData;

class VehicleFrictionProperties extends FrictionProperties {
    private final TIRE_FRICTION_NOMINATOR : Int;
    private final BRAKE_FRICTION_NOMINATOR : Int;
    private final AIR_FRICTION_NOMINATOR : Int;
    private final CRASH_FRICTION_NOMINATOR : Int;
    public function new(tireFriction : Int, brakeFriction : Int, airFriction : Int, crashFriction : Int) {
        super();
        this.TIRE_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - tireFriction;
        this.BRAKE_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - brakeFriction;
        this.AIR_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - airFriction;
        this.CRASH_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - crashFriction;
    }

    public function getTireFrictionNominator() : Int {
        return this.TIRE_FRICTION_NOMINATOR;
    }

    public function getBrakeFrictionNominator() : Int {
        return this.BRAKE_FRICTION_NOMINATOR;
    }

    public function getAirFrictionNominator() : Int {
        return this.AIR_FRICTION_NOMINATOR;
    }

    public function getCrashFrictionNominator() : Int {
        return this.CRASH_FRICTION_NOMINATOR;
    }

}

