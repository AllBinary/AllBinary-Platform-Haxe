/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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

import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.PositionStrings;
import org.allbinary.util.ABHashtable;

class LayerUtil {
    private static final HASHTABLE : String = "Hashtable: ";
    public static function toString(hashtable : ABHashtable<Any, Any>, x : Int, y : Int, z : Int) : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final positionStrings : PositionStrings = PositionStrings.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(LayerUtil.HASHTABLE);
        stringBuffer.append(StringUtil.getInstance().toString(hashtable));
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(positionStrings.X_LABEL);
        stringBuffer.appendint(x);
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(positionStrings.Y_LABEL);
        stringBuffer.appendint(y);
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(positionStrings.Z_LABEL);
        stringBuffer.appendint(z);
        return stringBuffer.toString();
    }

    public function new() {
    }
}

