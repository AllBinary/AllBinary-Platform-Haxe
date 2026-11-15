/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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


class SensorActionFactory {
    private static final instance : SensorActionFactory = new SensorActionFactory();
    public static function getInstance() : SensorActionFactory {
        return SensorActionFactory.instance;
    }

    public function new() {
    }

    public final ATTACK : SensorAction = new SensorAction("Attack");
    public final EVADE : SensorAction = new SensorAction("Evade");
}

