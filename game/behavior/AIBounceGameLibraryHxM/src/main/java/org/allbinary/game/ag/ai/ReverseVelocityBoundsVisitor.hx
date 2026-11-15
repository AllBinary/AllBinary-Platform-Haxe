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
package org.allbinary.game.ag.ai;

import org.allbinary.bounds.BoundsVisitorInterface;
import org.allbinary.game.physics.velocity.VelocityInterface;
import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface;
import org.allbinary.layer.LayerInterface;
import org.allbinary.logic.communication.log.LogUtil;

class ReverseVelocityBoundsVisitor implements BoundsVisitorInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var velocityInterface : VelocityInterface;
    private var layerInterface : LayerInterface;
    public function new(layerInterface : LayerInterface) {
        this.layerInterface = layerInterface;
        var velocityInterfaceCompositeInterface : VelocityInterfaceCompositeInterface = (cast layerInterface : VelocityInterfaceCompositeInterface);
        this.velocityInterface = (cast velocityInterfaceCompositeInterface.getVelocityProperties() : VelocityInterface);
    }

    public function getX() : Int {
        return this.layerInterface.getXP();
    }

    public function getY() : Int {
        return this.layerInterface.getYP();
    }

    public function minX() : Void {
        if (this.velocityInterface.getVelocityXBasicDecimalP().getUnscaled() < 0) {
            this.velocityInterface.getVelocityXBasicDecimalP().multiplyint(-1);
        }
    }

    public function maxX() : Void {
        if (this.velocityInterface.getVelocityXBasicDecimalP().getUnscaled() > 0) {
            this.velocityInterface.getVelocityXBasicDecimalP().multiplyint(-1);
        }
    }

    public function minY() : Void {
        if (this.velocityInterface.getVelocityYBasicDecimalP().getUnscaled() < 0) {
            this.velocityInterface.getVelocityYBasicDecimalP().multiplyint(-1);
        }
    }

    public function maxY() : Void {
        if (this.velocityInterface.getVelocityYBasicDecimalP().getUnscaled() > 0) {
            this.velocityInterface.getVelocityYBasicDecimalP().multiplyint(-1);
        }
    }

}

