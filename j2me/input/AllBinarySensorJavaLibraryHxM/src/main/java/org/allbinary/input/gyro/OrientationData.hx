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


class OrientationData {
    private static final SINGLETON : OrientationData = new OrientationData();
    public function new() {
    }

    public static function getInstance() : OrientationData {
        return OrientationData.SINGLETON;
    }

    public final ORIENTATION_SENSOR_INPUT : String = "Orientation Sensor Input";
    public final ORIENTATION_TYPE : String = "Orientation Type";
}

