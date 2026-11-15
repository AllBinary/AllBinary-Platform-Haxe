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
package org.allbinary.logic.string.tokens;

import org.allbinary.TsUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class Tokenizer {
    private var sep : String;
    private var endSep : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(sep : String) {
        if (sep == null || TsUtil.getInstance().compareTo(sep, StringUtil.getInstance().EMPTY_STRING) == 0) {
            throw new haxe.Exception("Sep provided is not valid");
        }
        this.sep = sep;
    }

    public function setSep(sep : String) : Void {
        this.sep = sep;
    }

    public function setEndSep(endSep : String) : Void {
        this.endSep = endSep;
    }

    public function getInsideSep(string : String) : BasicArrayList {
        final tokenList : BasicArrayList = new BasicArrayListD();
        var index : Int = 0;
        var size : Int = string.length;
        while (index < size) {
            index = string.indexOf(this.sep, index);
            if (index != -1) {
                var end : Int = string.indexOf(this.endSep, index + this.sep.length);
                if (end != -1) {
                    tokenList.add(string.substring(index + this.sep.length, end - (this.endSep.length - 1)));
                    index = end + this.endSep.length;
                } else {
                }
            } else {
                break;
            }
        }
        return tokenList;
    }

    public function getTokensFromString(string : String, tokenVector : BasicArrayList) : BasicArrayList {
        var index : Int = 0;
        var end : Int = 0;
        while (index < string.length) {
            end = string.indexOf(this.sep, index);
            if (end != -1) {
                tokenVector.add(string.substring(index, end));
                index = end + this.sep.length;
            } else {
                tokenVector.add(string.substring(index, string.length));
                break;
            }
        }
        return tokenVector;
    }

    public function getTokens(stringVector : BasicArrayList) : ABHashtable<Any, Any> {
        var tokenHashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
        var string : String = StringUtil.getInstance().EMPTY_STRING;
        var end : Int = 0;
        var size : Int = stringVector.size();
        for (index in 0...size) {
            string = (cast stringVector.objectArray[index] : String);
            end = string.indexOf(this.sep);
            if (end >= 0) {
                tokenHashtable.put(string.substring(0, end), string.substring(end + 1, string.length));
            }
        }
        return tokenHashtable;
    }

}

