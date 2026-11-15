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
package org.allbinary.logic.math;


class ScaleFactorFactory {
    private static final instance : ScaleFactorFactory = new ScaleFactorFactory();
    public static function getInstance() : ScaleFactorFactory {
        return ScaleFactorFactory.instance;
    }

    public var DEFAULT_SCALE_FACTOR : Int = 10;
    public var DEFAULT_SCALE_VALUE : Int = 1024;
    public function new() {
    }
}

