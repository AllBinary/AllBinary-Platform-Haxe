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
import org.allbinary.game.physics.velocity.BasicVelocityProperties;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;

class DelayedConstantVelocityMovement extends BasicConstantVelocityMovement {
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(60);
    public function new(basicDecimal : BasicDecimal, velocityProperties : BasicVelocityProperties) {
        super(basicDecimal, velocityProperties);
    }

    public override function init(speedBasicDecimal : BasicDecimal, angle : Int, otherAngle : Int) : Void {
    }

    // throws Exception
    public override function process(layer : AllBinaryGameLayer) : Void {
        if (this.timeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().startTime)) {
            super.process(layer);
        }
    }

}

