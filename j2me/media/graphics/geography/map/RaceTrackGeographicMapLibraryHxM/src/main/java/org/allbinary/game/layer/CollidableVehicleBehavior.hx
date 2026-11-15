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

import org.allbinary.game.layer.pickup.PickedUpLayerInterface;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;
import org.allbinary.game.collision.CollisionType;
import org.allbinary.game.collision.CollisionTypeFactory;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;

class CollidableVehicleBehavior extends CollidableDestroyableDamageableBehavior {
    public var totalImpactVelocity : haxe.Int64 = 0;
    public function new(collidable : Bool) {
        super(collidable);
    }

    // throws Exception
    public override function collide(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Void {
        final collisionTypeFactory : CollisionTypeFactory = CollisionTypeFactory.getInstance();
        final collisionType : CollisionType = collidableInterfaceCompositeInterface.getCollidableInferface().getCollisionTypeWith(ownerLayer);
        if (collisionType == collisionTypeFactory.PICKUP) {
            final collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = ((cast ownerLayer : CollidableDestroyableDamageableLayer));
            collidableDestroyableDamageableLayer.getPickupBehavior().doPickupLayer((cast collidableInterfaceCompositeInterface : PickedUpLayerInterface));
        } else if (collisionType == collisionTypeFactory.COLLISION) {
            super.collide(ownerLayer, collidableInterfaceCompositeInterface);
        } else {
            this.collideVehicle(ownerLayer, (cast collidableInterfaceCompositeInterface : VehiclePropertiesCompositeInterface));
        }
    }

    public override function collideInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Void {
        ForcedLogUtil.log("Don't Use Interface Version It Is Slower", this);
    }

    private var halfImpactVelocityX : haxe.Int64 = haxe.Int64.ofInt(0);
    private var halfImpactVelocityY : haxe.Int64 = haxe.Int64.ofInt(0);
    public function collideVehicle(ownerLayer : CollidableCompositeLayer, vehiclePropertiesCompositeInterface : VehiclePropertiesCompositeInterface) : Void {
        final ownerVehicleLayerInterface : VehiclePropertiesCompositeInterface = ((cast ownerLayer : VehiclePropertiesCompositeInterface));
        final ownerVehicleProperties : VehicleProperties = ownerVehicleLayerInterface.getVehicleProperties();
        final vehicleProperties : VehicleProperties = vehiclePropertiesCompositeInterface.getVehicleProperties();
        final impactVelocityX : haxe.Int64 = ownerVehicleProperties.getVelocityProperties().getVelocityXBasicDecimalP().getUnscaled() - vehicleProperties.getVelocityProperties().getVelocityXBasicDecimalP().getUnscaled();
        final impactVelocityY : haxe.Int64 = ownerVehicleProperties.getVelocityProperties().getVelocityYBasicDecimalP().getUnscaled() - vehicleProperties.getVelocityProperties().getVelocityYBasicDecimalP().getUnscaled();
        if (impactVelocityX != haxe.Int64.ofInt(0)) {
            this.halfImpactVelocityX = (impactVelocityX >> 1);
            ownerVehicleProperties.getVelocityProperties().getVelocityXBasicDecimalP().addlong(this.halfImpactVelocityX);
            vehicleProperties.getVelocityProperties().getVelocityXBasicDecimalP().addlong(this.halfImpactVelocityX);
        } else {
        }
        if (impactVelocityY != haxe.Int64.ofInt(0)) {
            this.halfImpactVelocityY = (impactVelocityY >> 1);
            ownerVehicleProperties.getVelocityProperties().getVelocityYBasicDecimalP().addlong(this.halfImpactVelocityY);
            vehicleProperties.getVelocityProperties().getVelocityXBasicDecimalP().addlong(this.halfImpactVelocityY);
        } else {
        }
        this.collideFriction(ownerVehicleLayerInterface);
        this.collideFriction(vehiclePropertiesCompositeInterface);
        this.totalImpactVelocity = impactVelocityX + impactVelocityY;
    }

    private function collideFriction(vehiclePropertiesCompositeInterface : VehiclePropertiesCompositeInterface) : Void {
        final vehicleFrictionProperties : VehicleFrictionProperties = vehiclePropertiesCompositeInterface.getVehicleProperties().getVehicleFrictionProperties();
        vehiclePropertiesCompositeInterface.getVehicleProperties().getVehicleFrictionProperties().friction(vehiclePropertiesCompositeInterface.getVehicleProperties().getVelocityProperties(), vehicleFrictionProperties.getCrashFrictionNominator());
    }

}

