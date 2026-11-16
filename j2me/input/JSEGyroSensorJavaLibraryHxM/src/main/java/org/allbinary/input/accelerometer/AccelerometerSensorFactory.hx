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
package org.allbinary.input.accelerometer;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.SensorFeatureFactory;
import org.allbinary.input.gyro.AllBinaryOrientationSensor;

class AccelerometerSensorFactory {
    private static var allBinaryAccelerometerSensor : AllBinaryOrientationSensor = null;
    // throws Exception
    public static function init() : Void {
        var features : Features = Features.getInstance();
        var sensorFeatureFactory : SensorFeatureFactory = SensorFeatureFactory.getInstance();
        if (features.isFeature(sensorFeatureFactory.ORIENTATION_SENSORS)) {
            throw new jre.lang.JavaException("No Orientation Sensors");
        } else if (features.isFeature(sensorFeatureFactory.SIMULATED_ORIENTATION_SENSORS)) {
            throw new jre.lang.JavaException("No Simulation Sensors");
        } else if (features.isFeature(sensorFeatureFactory.NO_ORIENTATION)) {
            AccelerometerSensorFactory.allBinaryAccelerometerSensor = new NoAccelerometerSensor();
        } else {
            throw new jre.lang.JavaException("Not Such SensorFeature");
        }
    }

    public static function getInstance() : AllBinaryOrientationSensor {
        return AccelerometerSensorFactory.allBinaryAccelerometerSensor;
    }

    public function new() {
    }
}

