/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2026 AllBinary 
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
package org.allbinary.logic;

//import javax.microedition.lcdui.Item;
import org.allbinary.graphics.displayable.screen.CommandForm;

//Handle the differences in the public platform vs the raw JS build
class MEUtil {
    public static function getInstance() : MEUtil {
        return MEUtil.instance;
    }

    private static final instance : MEUtil = new MEUtil();
    public function appendItem(form : CommandForm, item : Item) : Void {
        form.append(item);
    }

    public function new() {
    }
}

