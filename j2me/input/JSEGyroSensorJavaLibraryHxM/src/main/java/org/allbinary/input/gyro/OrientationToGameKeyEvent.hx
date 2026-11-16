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
package org.allbinary.input.gyro;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.SensorFeatureFactory;
import org.allbinary.logic.math.Orientation;

class OrientationToGameKeyEvent {
    private var allBinaryGyroSensor : AllBinaryOrientationSensor = null;
    private final MIN : Int = 15;
    public function new() {
        if (Features.getInstance().isFeature(SensorFeatureFactory.getInstance().NO_ORIENTATION)) {
            this.allBinaryGyroSensor = new NoGyroSensor();
        } else {
            throw new jre.lang.JavaException("Not Such Feature");
        }
    }

    public function setAllBinaryGyroSensor(allBinaryGyroSensor : AllBinaryOrientationSensor) : Void {
        this.allBinaryGyroSensor = allBinaryGyroSensor;
    }

    public function getAllBinaryGyroSensor() : AllBinaryOrientationSensor {
        return this.allBinaryGyroSensor;
    }

    // throws Exception
    public function process() : Void {
    }

    // throws Exception
    private function updateGameKeyEvents(orientation : Orientation, yaw : Int, pitch : Int, roll : Int) : Void {
    }

}

