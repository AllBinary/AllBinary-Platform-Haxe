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

import org.allbinary.logic.math.SmallIntegerSingletonFactory;

class Driver {
    public static final NULL_DRIVER : Driver = new Driver(SmallIntegerSingletonFactory.getInstance().getAt(0), SmallIntegerSingletonFactory.getInstance().getAt(0), new Aggression(SmallIntegerSingletonFactory.getInstance().getAt(0), SmallIntegerSingletonFactory.getInstance().getAt(0), SmallIntegerSingletonFactory.getInstance().getAt(0)));
    private var turnSpeed : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(0);
    private var trackPathSelectionSkill : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(0);
    private var aggression : Aggression;
    public function new(turnSpeed : Null<Int>, trackPathSelectionSkill : Null<Int>, aggression : Aggression) {
        this.setTurnSpeed(turnSpeed);
        this.setTrackPathSelectionSkill(trackPathSelectionSkill);
        this.aggression = aggression;
    }

    public function getTurnSpeed() : Null<Int> {
        return this.turnSpeed;
    }

    public function setTurnSpeed(turnSpeed : Null<Int>) : Void {
        this.turnSpeed = turnSpeed;
    }

    public function getTrackPathSelectionSkill() : Null<Int> {
        return this.trackPathSelectionSkill;
    }

    public function setTrackPathSelectionSkill(trackPathSelectionSkill : Null<Int>) : Void {
        this.trackPathSelectionSkill = trackPathSelectionSkill;
    }

    public function getAggression() : Aggression {
        return this.aggression;
    }

    public function setAggression(aggression : Aggression) : Void {
        this.aggression = aggression;
    }

}

