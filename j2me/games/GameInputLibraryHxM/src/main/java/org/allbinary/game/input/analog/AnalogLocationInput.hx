// Generated Code Do Not Modify
package org.allbinary.game.input.analog;

import org.allbinary.graphics.CustomGPoint;

class AnalogLocationInput {
    public static final NULL_ANALOG_LOCATION_INPUT : AnalogLocationInput = new AnalogLocationInput(-1);
    private final playerId : Int;
    private final customGPoint : CustomGPoint;
    private var rz : Int = 0;
    private var rightTrigger : Int = 0;
    private var leftTrigger : Int = 0;
    public function new(playerId : Int) {
        this.playerId = playerId;
        this.customGPoint = new CustomGPoint(0, 0, 0);
    }

    public function getPlayerId() : Int {
        return this.playerId;
    }

    public function getCustomGPoint() : CustomGPoint {
        return this.customGPoint;
    }

    public function getRz() : Int {
        return this.rz;
    }

    public function setRz(rz : Int) : Void {
        this.rz = rz;
    }

    public function getRightTrigger() : Int {
        return this.rightTrigger;
    }

    public function setRightTrigger(rightTrigger : Int) : Void {
        this.rightTrigger = rightTrigger;
    }

    public function getLeftTrigger() : Int {
        return this.leftTrigger;
    }

    public function setLeftTrigger(leftTrigger : Int) : Void {
        this.leftTrigger = leftTrigger;
    }

}

