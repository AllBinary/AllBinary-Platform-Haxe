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
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.logic.math.BasicDecimal;

class XYOscillateVelocityMovement extends BasicConstantVelocityMovement {
    private var oscillateMin : Int;
    private var oscillateMax : Int;
    private var oscillate : Int = 0;
    private var oscillatePositive : Bool = false;
    public function new(speedBasicDecimal : BasicDecimal, oscillateMin : Int, oscillateMax : Int) {
        super(speedBasicDecimal, new VelocityProperties(Std.int(speedBasicDecimal.getUnscaled()), Std.int(speedBasicDecimal.getUnscaled())));
        this.oscillateMin = oscillateMin;
        this.oscillateMax = oscillateMax;
    }

    // throws Exception
    public override function process(layer : AllBinaryGameLayer) : Void {
        super.process(layer);
        if (this.oscillate < this.oscillateMin) {
            this.oscillatePositive = true;
            this.getVelocityProperties().getVelocityYBasicDecimalP().addint(3000);
        } else if (this.oscillate > this.oscillateMax) {
            this.oscillatePositive = false;
            this.getVelocityProperties().getVelocityYBasicDecimalP().subtractint(3000);
        }
        if (this.oscillatePositive) {
            this.oscillate++;
            this.getVelocityProperties().getVelocityXBasicDecimalP().addint(5000);
        } else {
            this.oscillate--;
            this.getVelocityProperties().getVelocityXBasicDecimalP().subtractint(5000);
        }
    }

}

