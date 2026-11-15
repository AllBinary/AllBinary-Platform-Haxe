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

import org.eclipse.swt.widgets.Display;

class SWTRunnableProcessor extends SWTProcessor {
    private static final instanceR : SWTRunnableProcessor = new SWTRunnableProcessor();
    public static function getInstance() : SWTRunnableProcessor {
        return SWTRunnableProcessor.instanceR;
    }

    public override function process(display : Display) : Void {
    }

    public function new() {
        super();
    }
}

