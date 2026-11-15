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
package org.allbinary.game.physics.acceleration;

import org.allbinary.game.physics.velocity.BasicVelocityProperties;

class GravityUtil {
    private static final instance : GravityUtil = new GravityUtil();
    public static function getInstance() : GravityUtil {
        return GravityUtil.instance;
    }

    public final GAME_GRAVITY_VELOCITY : Int = 1800;
    public final MAX_GAME_VELOCITY : Int = 18000;
    public function process(velocityProperties : BasicVelocityProperties, customGravity : Int) : Void {
        velocityProperties.getVelocityYBasicDecimalP().addint(customGravity);
    }

    public function new() {
    }
}

