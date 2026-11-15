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
package org.allbinary.logic.string;

//import java.util.HashMap;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.math.MathData;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;

class SpecialCharacterUtil {
    public static function getHashMap() : HashMap {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final commonPhoneStrings : CommonPhoneStrings = CommonPhoneStrings.getInstance();
        final stringUtil : StringUtil = StringUtil.getInstance();
        final hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put("!", stringUtil.EMPTY_STRING);
        hashMap.put("@", stringUtil.EMPTY_STRING);
        hashMap.put(commonPhoneStrings.POUND, stringUtil.EMPTY_STRING);
        hashMap.put("$", stringUtil.EMPTY_STRING);
        hashMap.put("%", stringUtil.EMPTY_STRING);
        hashMap.put("^", stringUtil.EMPTY_STRING);
        hashMap.put(commonSeps.AMPERSAND, stringUtil.EMPTY_STRING);
        hashMap.put(commonPhoneStrings.STAR, stringUtil.EMPTY_STRING);
        hashMap.put(commonSeps.PARENTHESIS_OPEN, stringUtil.EMPTY_STRING);
        hashMap.put(commonSeps.PARENTHESIS_CLOSE, stringUtil.EMPTY_STRING);
        hashMap.put(commonSeps.DASH, stringUtil.EMPTY_STRING);
        hashMap.put(commonSeps.UNDERSCORE, stringUtil.EMPTY_STRING);
        hashMap.put(MathData.getInstance().PLUS, stringUtil.EMPTY_STRING);
        hashMap.put(commonSeps.EQUALS, stringUtil.EMPTY_STRING);
        hashMap.put("\\", stringUtil.EMPTY_STRING);
        hashMap.put("|", stringUtil.EMPTY_STRING);
        hashMap.put(AbPathData.getInstance().EXTENSION_SEP, stringUtil.EMPTY_STRING);
        hashMap.put(",", stringUtil.EMPTY_STRING);
        hashMap.put("<", stringUtil.EMPTY_STRING);
        hashMap.put(">", stringUtil.EMPTY_STRING);
        hashMap.put("?", stringUtil.EMPTY_STRING);
        hashMap.put(AbPathData.getInstance().SEPARATOR, stringUtil.EMPTY_STRING);
        hashMap.put("~", stringUtil.EMPTY_STRING);
        hashMap.put("`", stringUtil.EMPTY_STRING);
        return hashMap;
    }

    public function new() {
    }
}

