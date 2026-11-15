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

import org.allbinary.input.AllBinarySensor;
import org.allbinary.input.NoAllBinarySensor;

class SensorGameUpdateProcessor {
    private var inputSensor : AllBinarySensor = NoAllBinarySensor.getInstance();
    public function setInputSensor(inputSensor : AllBinarySensor) : Void {
        this.inputSensor = inputSensor;
    }

    public function getInputSensor() : AllBinarySensor {
        return this.inputSensor;
    }

    // throws Exception
    public function process(anyType : Any) : Void {
    }

    // throws Exception
    public function sendNotifications(anyType : Any) : Void {
    }

    public function isAnySensor() : Bool {
        if (this.inputSensor == NoAllBinarySensor.getInstance()) {
            return false;
        } else {
            return true;
        }
    }

    public function setNoSensors() : Void {
        this.setInputSensor(NoAllBinarySensor.getInstance());
    }

    public function new() {
    }
}

