/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.input.motion.button;


class TouchScreenTypesFactory {
    private static final instance : TouchScreenTypesFactory = new TouchScreenTypesFactory();
    public static function getInstance() : TouchScreenTypesFactory {
        return TouchScreenTypesFactory.instance;
    }

    public final FINGER : TouchScreenType = new TouchScreenType("Finger");
    public final NOTOUCH : TouchScreenType = new TouchScreenType("No Touch");
    public final STYLUS : TouchScreenType = new TouchScreenType("Stylus");
    public final UNDEFINED : TouchScreenType = new TouchScreenType("Undefined");
    public function new() {
    }
}

