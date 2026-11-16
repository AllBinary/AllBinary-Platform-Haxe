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
package org.allbinary.physics.movement;

import org.allbinary.game.layer.AllBinaryGameLayer;
import org.allbinary.game.physics.acceleration.GravityUtil;
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.logic.math.BasicDecimal;

class BasicGravityConstantVelocityMovement extends BasicConstantVelocityMovement {
    public function new(speedBasicDecimal : BasicDecimal) {
        super(speedBasicDecimal, new VelocityProperties(jre.lang.JavaNumber.toInt(speedBasicDecimal.getUnscaled()), jre.lang.JavaNumber.toInt(speedBasicDecimal.getUnscaled())));
    }

    private final gravityUtil : GravityUtil = GravityUtil.getInstance();
    // throws Exception
    public override function process(layer : AllBinaryGameLayer) : Void {
        super.process(layer);
        this.gravityUtil.process(this.getVelocityProperties(), this.gravityUtil.GAME_GRAVITY_VELOCITY);
    }

}

