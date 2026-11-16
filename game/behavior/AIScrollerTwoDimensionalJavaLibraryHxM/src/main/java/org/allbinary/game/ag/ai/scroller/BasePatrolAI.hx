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
package org.allbinary.game.ag.ai.scroller;

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.physics.velocity.BasicVelocityProperties;
import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.math.MathUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.util.ABHashtable;

class BasePatrolAI extends BasicAI {
    public static final MAX_DISTANCE : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(2);
    public static final DIRECTION_ARRAY : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(3);
    public static final FIRING_DISTANCE : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(4);
    public static var SPEED : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(5);
    public var maxDistance : Null<Int>;
    public var currentDistance : Int;
    public var xTotalDistance : Int = 0;
    public var lastKeyDirection : Int = Canvas.RIGHT;
    public var keyDirection : Int = Canvas.RIGHT;
    public function new(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
        this.maxDistance = (cast hashtable.get(BasePatrolAI.MAX_DISTANCE) : Null<Int>);
        this.currentDistance = jre.lang.JavaNumber.toInt(this.maxDistance);
    }

    public function update() : Void {
        this.updateTotalDistance();
        this.changeDirectionIfReachedPacingAreaMax();
    }

    private function updateTotalDistance() : Void {
        final velocityInterfaceCompositeInterface : VelocityInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : VelocityInterfaceCompositeInterface);
        final velocityProperties : BasicVelocityProperties = velocityInterfaceCompositeInterface.getVelocityProperties();
        this.xTotalDistance += velocityProperties.getVelocityXBasicDecimalP().getScaled();
    }

    private function changeDirectionIfReachedPacingAreaMax() : Void {
        final mathUtil : MathUtil = MathUtil.getInstance();
        final totalDistance : Int = mathUtil.abs(this.xTotalDistance);
        if (totalDistance > this.currentDistance) {
            this.nextDirection();
        }
    }

    public function nextDirection() : Void {
        if (this.lastKeyDirection == Canvas.LEFT) {
            this.keyDirection = Canvas.RIGHT;
            this.lastKeyDirection = this.keyDirection;
            this.xTotalDistance = 0;
        } else if (this.lastKeyDirection == Canvas.RIGHT) {
            this.keyDirection = Canvas.LEFT;
            this.lastKeyDirection = this.keyDirection;
            this.xTotalDistance = 0;
        }
    }

    public function disable() : Void {
    }

}

