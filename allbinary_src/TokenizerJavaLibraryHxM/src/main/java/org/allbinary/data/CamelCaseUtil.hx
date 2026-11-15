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
package org.allbinary.data;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class CamelCaseUtil {
    private static final instance : CamelCaseUtil = new CamelCaseUtil();
    public static function getInstance() : CamelCaseUtil {
        return CamelCaseUtil.instance;
    }

    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    // throws Exception
    public function getAsCamelCase(string : String, stringBuilder : StringMaker) : String {
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        stringBuilder.delete(0, stringBuilder.length());
        final list : BasicArrayList = new BasicArrayListD();
        final tokenizer : Tokenizer = new Tokenizer(this.commonSeps.UNDERSCORE);
        tokenizer.getTokensFromString(string, list);
        final size : Int = list.size();
        var word : String = null;
        for (i in 0...size) {
            word = (cast list.get(i) : String);
            word = (stringValidationUtil.isEmpty(word) ? word : Std.string(new StringMaker().appendchar(String.fromCharCode(word.charCodeAt(0)).toUpperCase().charCodeAt(0)).append(word.substring(1).toLowerCase())));
            stringBuilder.append(word);
        }
        return Std.string(stringBuilder);
    }

    public function new() {
    }
}

