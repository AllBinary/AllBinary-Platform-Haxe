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
package org.allbinary.graphics.font;

//import javax.microedition.lcdui.Graphics;

class UpdateMyFontProcessor extends MyFontProcessor {
    private final updateMeasurementProcessor : UpdateMyFontInterface;
    public function new(keyValueDrawCharArray : UpdateMyFontInterface) {
        super();
        this.updateMeasurementProcessor = keyValueDrawCharArray;
    }

    public override function process(graphics : Graphics) : Void {
        this.updateMeasurementProcessor.updateMeasurement(graphics);
    }

}

