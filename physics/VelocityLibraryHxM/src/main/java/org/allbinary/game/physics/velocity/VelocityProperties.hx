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


class VelocityProperties extends BasicVelocityProperties implements VelocityInterface {
    public static final NULL_VELOCITY_PROPERTIES : VelocityProperties = new VelocityProperties(0, 0);
    private var maxForwardVelocity : Int = 0;
    private var maxReverseVelocity : Int = 0;
    public function new(maxForwardVelocity : Int, maxReverseVelocity : Int) {
        super();
        this.setMaxForwardVelocity(maxForwardVelocity);
        this.setMaxReverseVelocity(maxReverseVelocity);
    }

    public function getMaxForwardVelocity() : Int {
        return this.maxForwardVelocity;
    }

    public function setMaxForwardVelocity(maxForwardVelocity : Int) : Void {
        this.maxForwardVelocity = maxForwardVelocity;
    }

    public function getMaxReverseVelocity() : Int {
        return this.maxReverseVelocity;
    }

    public function setMaxReverseVelocity(maxReverseVelocity : Int) : Void {
        this.maxReverseVelocity = maxReverseVelocity;
    }

    public function limitMaxXYForwardVelocity() : Void {
        this.limitMaxXYVelocity(this.getMaxForwardVelocity());
    }

    public function limitMaxXYReverseVelocity() : Void {
        this.limitMaxXYVelocity(this.getMaxReverseVelocity());
    }

    public function limitMaxYForwardVelocity() : Void {
        this.limitMaxYVelocity(this.getMaxForwardVelocity());
    }

    public function limitMaxYReverseVelocity() : Void {
        this.limitMaxYVelocity(this.getMaxReverseVelocity());
    }

    public function limitMaxXForwardVelocity() : Void {
        this.limitMaxXVelocity(this.getMaxForwardVelocity());
    }

    public function limitMaxXReverseVelocity() : Void {
        this.limitMaxXVelocity(this.getMaxReverseVelocity());
    }

    public function isOverXYMaxForwardVelocity() : Bool {
        return this.isOverXYMaxVelocity(this.getMaxForwardVelocity());
    }

    public function isOverXYMaxReverseVelocity() : Bool {
        return this.isOverXYMaxVelocity(this.getMaxReverseVelocity());
    }

    public function limitXYToForwardAndReverseMaxVelocity() : Void {
        this.limitMaxXYForwardVelocity();
        this.limitMaxXYReverseVelocity();
    }

    public function limitMaxXYVelocity(maxVelocity : Int) : Void {
        this.limitMaxXVelocity(maxVelocity);
        this.limitMaxYVelocity(maxVelocity);
    }

    public function limitMaxPositiveYVelocity(maxVelocity : Int) : Void {
        if (this.velocityYBasicDecimal.getUnscaled() > maxVelocity) {
            this.velocityYBasicDecimal.setint(maxVelocity);
        }
    }

    public function limitMaxNegativeYVelocity(maxVelocity : Int) : Void {
        if (this.velocityYBasicDecimal.getUnscaled() < -maxVelocity) {
            this.velocityYBasicDecimal.setint(-maxVelocity);
        }
    }

    public function limitMaxYVelocity(maxVelocity : Int) : Void {
        this.limitMaxPositiveYVelocity(maxVelocity);
        this.limitMaxNegativeYVelocity(maxVelocity);
    }

    public function limitMaxXVelocity(maxVelocity : Int) : Void {
        if (this.velocityXBasicDecimal.getUnscaled() > maxVelocity) {
            this.velocityXBasicDecimal.setint(maxVelocity);
        }
        if (this.velocityXBasicDecimal.getUnscaled() < -maxVelocity) {
            this.velocityXBasicDecimal.setint(-maxVelocity);
        }
    }

    public function isOverXYMaxVelocity(maxVelocity : Int) : Bool {
        if (this.velocityXBasicDecimal.getUnscaled() > maxVelocity) {
            return true;
        }
        if (this.velocityXBasicDecimal.getUnscaled() < -maxVelocity) {
            return true;
        }
        if (this.velocityYBasicDecimal.getUnscaled() > maxVelocity) {
            return true;
        }
        if (this.velocityYBasicDecimal.getUnscaled() < -maxVelocity) {
            return true;
        }
        return false;
    }

    public override function setVelocityi(magnitude : haxe.Int64, angle : Int, otherAngle : Int) : Void {
        super.setVelocityi(magnitude, angle, otherAngle);
        this.limitXYToForwardAndReverseMaxVelocity();
    }

    public override function addVelocityi(magnitude : haxe.Int64, angle : Int, otherAngle : Int) : Void {
        super.addVelocityi(magnitude, angle, otherAngle);
        this.limitXYToForwardAndReverseMaxVelocity();
    }

}

