/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.behavior.topview;

import org.allbinary.game.physics.FrictionProperties;
import org.allbinary.game.physics.friction.FrictionData;

class CharacterFrictionProperties extends FrictionProperties {
    private final WATER_FRICTION_NOMINATOR : Int;
    private final AIR_FRICTION_NOMINATOR : Int;
    private final COLLISION_FRICTION_NOMINATOR : Int;
    public function new(airFriction : Int, waterFriction : Int, collisionFriction : Int) {
        super();
        this.AIR_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - airFriction;
        this.COLLISION_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - collisionFriction;
        this.WATER_FRICTION_NOMINATOR = FrictionData.getFrictionDenominator() - waterFriction;
    }

    public function getWATER_FRICTION_NOMINATOR() : Int {
        return this.WATER_FRICTION_NOMINATOR;
    }

    public function getAIR_FRICTION_NOMINATOR() : Int {
        return this.AIR_FRICTION_NOMINATOR;
    }

    public function getCOLLISION_FRICTION_NOMINATOR() : Int {
        return this.COLLISION_FRICTION_NOMINATOR;
    }

}

