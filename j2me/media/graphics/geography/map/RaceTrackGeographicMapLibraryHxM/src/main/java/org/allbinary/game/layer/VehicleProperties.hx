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

import org.allbinary.game.physics.velocity.VelocityProperties;

class VehicleProperties {
    private final velocityProperties : VelocityProperties;
    private var vehicleFrictionProperties : VehicleFrictionProperties;
    public function new(velocityProperties : VelocityProperties, vehicleFrictionProperties : VehicleFrictionProperties) {
        this.velocityProperties = velocityProperties;
        this.vehicleFrictionProperties = vehicleFrictionProperties;
    }

    public function getVehicleFrictionProperties() : VehicleFrictionProperties {
        return this.vehicleFrictionProperties;
    }

    public function setVehicleFrictionProperties(vehicleFrictionProperties : VehicleFrictionProperties) : Void {
        this.vehicleFrictionProperties = vehicleFrictionProperties;
    }

    public function getVelocityProperties() : VelocityProperties {
        return this.velocityProperties;
    }

}

