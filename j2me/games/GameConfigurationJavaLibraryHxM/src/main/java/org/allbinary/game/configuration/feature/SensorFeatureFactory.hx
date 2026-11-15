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
package org.allbinary.game.configuration.feature;


class SensorFeatureFactory {
    private static final instance : SensorFeatureFactory = new SensorFeatureFactory();
    public static function getInstance() : SensorFeatureFactory {
        return SensorFeatureFactory.instance;
    }

    public function new() {
    }

    public final NO_ORIENTATION : SensorFeature = new SensorFeature("No Orientation");
    public final ORIENTATION_SENSORS : SensorFeature = new SensorFeature("Orientation Sensors");
    public final SIMULATED_ORIENTATION_SENSORS : SensorFeature = new SensorFeature("Simulated Orientation Sensors");
    public final YAW : SensorFeature = new SensorFeature("Yaw");
    public final YAW_MINUS_RIGHT_PLUS_LEFT : SensorFeature = new SensorFeature("Yaw -Right +Left");
    public final YAW_MINUS_LEFT_PLUS_RIGHT : SensorFeature = new SensorFeature("Yaw -Left +Right ");
    public final PITCH : SensorFeature = new SensorFeature("Pitch");
    public final ROLL : SensorFeature = new SensorFeature("Roll");
}

