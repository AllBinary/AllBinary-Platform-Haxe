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
import org.allbinary.thread.NullRunnable;

class SWTProcessor {
    private static final instance : SWTProcessor = new SWTProcessor();
    public static function getInstance() : SWTProcessor {
        return SWTProcessor.instance;
    }

    public var runnable : Runnable = NullRunnable.getInstance();
    public function process(display : Display) : Void {
        display.sleep();
    }

    public function new() {
    }
}

