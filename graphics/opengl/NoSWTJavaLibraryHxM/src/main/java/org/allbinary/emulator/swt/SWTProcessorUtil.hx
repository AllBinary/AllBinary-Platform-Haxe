/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.emulator.swt;


class SWTProcessorUtil {
    private static final instance : SWTProcessorUtil = new SWTProcessorUtil();
    public static function getInstance() : SWTProcessorUtil {
        return SWTProcessorUtil.instance;
    }

    public var swtProcessor : SWTProcessor = SWTProcessor.getInstance();
    public function new() {
    }
}

