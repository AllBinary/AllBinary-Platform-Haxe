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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class PropertyInitUtil {
    private static final instance : PropertyInitUtil = new PropertyInitUtil();
    public static function getInstance(value : Int) : PropertyInitUtil {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final logUtil : LogUtil = LogUtil.getInstance();
        logUtil.putF(Std.string(new StringMaker().append("PropertyInitUtil: ").appendint(value)), logUtil, commonStrings.CONSTRUCTOR);
        return PropertyInitUtil.instance;
    }

    public function new() {
    }
}

