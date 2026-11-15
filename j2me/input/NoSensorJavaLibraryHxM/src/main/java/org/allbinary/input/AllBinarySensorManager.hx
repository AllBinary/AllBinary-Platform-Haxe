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
package org.allbinary.input;

import org.allbinary.input.accelerometer.AccelerometerSensorFactory;
import org.allbinary.input.gyro.GyroSensorFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AllBinarySensorManager {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : AllBinarySensorManager {
        if (AllBinarySensorManager.instance == NullUtil.getInstance().NULL_OBJECT) {
            AllBinarySensorManager.instance = new AllBinarySensorManager();
        }
        return (cast AllBinarySensorManager.instance : AllBinarySensorManager);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final ORIENTATION_SENSOR_INPUT : String = "Orientation Sensor Input";
    public final ORIENTATION_TYPE : String = "Orientation Type";
    public function new() {
        try {
            GyroSensorFactory.init();
            AccelerometerSensorFactory.init();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
        }
    }

    public function init() : Void {
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function getSensorNamesList() : BasicArrayList {
        return this.list;
    }

    public function shutdown() : Void {
    }

}

