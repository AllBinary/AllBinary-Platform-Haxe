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
package org.allbinary.android.input.motion;

import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.time.TimeDelayHelper;

class AnalogControllerHelper {
    private final reduceTimeFactor : Int;
    public function new(reduceTimeFactor : Int) {
        this.reduceTimeFactor = reduceTimeFactor;
    }

    private final SCALE_VALUE : Int = AnalogControllerConfigurationFactory.getInstance().SCALE_VALUE;
    private final rightTimeElapsedHelper : TimeDelayHelper = new TimeDelayHelper(0);
    private final leftTimeElapsedHelper : TimeDelayHelper = new TimeDelayHelper(0);
    private final downTimeElapsedHelper : TimeDelayHelper = new TimeDelayHelper(0);
    private final upTimeElapsedHelper : TimeDelayHelper = new TimeDelayHelper(0);
    // throws Exception
    public function right(collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer, xAnalogValue : Int) : Void {
        this.rightTimeElapsedHelper.delay = ((this.SCALE_VALUE - xAnalogValue) >> this.reduceTimeFactor);
        if (this.rightTimeElapsedHelper.isTimeTNT()) {
            collidableDestroyableDamageableLayer.right();
        }
    }

    // throws Exception
    public function left(collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer, xAnalogValue : Int) : Void {
        this.leftTimeElapsedHelper.delay = ((this.SCALE_VALUE + xAnalogValue) >> this.reduceTimeFactor);
        if (this.leftTimeElapsedHelper.isTimeTNT()) {
            collidableDestroyableDamageableLayer.left();
        }
    }

    // throws Exception
    public function up(collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer, xAnalogValue : Int) : Void {
        this.upTimeElapsedHelper.delay = ((this.SCALE_VALUE - xAnalogValue) >> this.reduceTimeFactor);
        if (this.upTimeElapsedHelper.isTimeTNT()) {
            collidableDestroyableDamageableLayer.up();
        }
    }

    // throws Exception
    public function down(collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer, xAnalogValue : Int) : Void {
        this.downTimeElapsedHelper.delay = ((this.SCALE_VALUE + xAnalogValue) >> this.reduceTimeFactor);
        if (this.downTimeElapsedHelper.isTimeTNT()) {
            collidableDestroyableDamageableLayer.down();
        }
    }

}

