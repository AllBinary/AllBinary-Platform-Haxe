/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

import org.allbinary.game.layer.behavior.GameLayerBehavior;
import org.allbinary.game.physics.acceleration.BasicAccelerationProperties;
import org.allbinary.game.physics.velocity.VelocityProperties;

class TopViewGameLayerBehavior extends GameLayerBehavior {
    public final maxGravityActionIndex : Int;
    public var isJumpAction : Bool = true;
    public var isJumpOver : Bool = false;
    public var isFallingWithoutJumpAttempt : Bool = false;
    public var gravityActionIndex : Int = 0;
    public function new(maxGravityActionIndex : Int) {
        super();
        this.maxGravityActionIndex = maxGravityActionIndex;
    }

    public function gravity() : Void {
        if (this.gravityActionIndex == 0) {
            this.gravityActionIndex++;
            this.isFallingWithoutJumpAttempt = true;
        }
    }

    public function land(velocityProperties : VelocityProperties) : Void {
        velocityProperties.getVelocityYBasicDecimalP().setint(0);
        this.landReset();
    }

    public function landReset() : Void {
        this.gravityActionIndex = 0;
        this.isFallingWithoutJumpAttempt = false;
        this.isJumpAction = true;
        this.isJumpOver = false;
    }

    public function up(velocityProperties : VelocityProperties, acceleration : BasicAccelerationProperties, jumpBehavior : InitialJumpBehavior, accelerationMultiplier : Int) : Void {
        if (!this.isJumpOver) {
            if (this.gravityActionIndex < this.maxGravityActionIndex) {
                final acceleration2 : Int = -acceleration.getForward() * accelerationMultiplier;
                velocityProperties.getVelocityYBasicDecimalP().addint(acceleration2);
                velocityProperties.limitXYToForwardAndReverseMaxVelocity();
                this.gravityActionIndex++;
            } else {
            }
        } else {
        }
        if (this.isJumpAction) {
            jumpBehavior.process();
            this.isJumpAction = false;
        }
    }

    public function inputFrames(velocityProperties : VelocityProperties) : Void {
        if (this.gravityActionIndex > 0 && velocityProperties.getVelocityYBasicDecimalP().getUnscaled() > 0) {
            this.isJumpOver = true;
        }
    }

}

