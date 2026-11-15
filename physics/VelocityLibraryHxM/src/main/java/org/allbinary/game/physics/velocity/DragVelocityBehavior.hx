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
package org.allbinary.game.physics.velocity;

import org.allbinary.logic.math.BasicDecimal;

class DragVelocityBehavior extends VelocityBehaviorBase {
    public static final instance : DragVelocityBehavior = new DragVelocityBehavior();
    public override function reduce(velocityProperties : BasicVelocityProperties, nominator : Int, denominator : Int) : Void {
        if (velocityProperties.getVelocityXBasicDecimalP().getUnscaled() != haxe.Int64.ofInt(0)) {
            final basicDecimal : BasicDecimal = velocityProperties.getVelocityXBasicDecimalP();
            basicDecimal.multiplyint(nominator);
            basicDecimal.divideint(denominator);
        }
        if (velocityProperties.getVelocityYBasicDecimalP().getUnscaled() != haxe.Int64.ofInt(0)) {
            final basicDecimal : BasicDecimal = velocityProperties.getVelocityYBasicDecimalP();
            basicDecimal.multiplyint(nominator);
            basicDecimal.divideint(denominator);
        }
    }

    public override function reduceX(velocityProperties : BasicVelocityProperties, nominator : Int, denominator : Int) : Void {
        final basicDecimal : BasicDecimal = velocityProperties.getVelocityXBasicDecimalP();
        if (basicDecimal.getUnscaled() != haxe.Int64.ofInt(0)) {
            basicDecimal.multiplyint(nominator);
            basicDecimal.divideint(denominator);
        }
    }

    public override function reduceY(velocityProperties : BasicVelocityProperties, nominator : Int, denominator : Int) : Void {
        if (velocityProperties.getVelocityYBasicDecimalP().getUnscaled() != haxe.Int64.ofInt(0)) {
            final basicDecimal : BasicDecimal = velocityProperties.getVelocityYBasicDecimalP();
            basicDecimal.multiplyint(nominator);
            basicDecimal.divideint(denominator);
        }
    }

    public function new() {
        super();
    }
}

