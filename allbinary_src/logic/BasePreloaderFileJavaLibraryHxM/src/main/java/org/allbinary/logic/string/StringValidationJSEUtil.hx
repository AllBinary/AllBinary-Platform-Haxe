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


class StringValidationJSEUtil {
    public function new() {
    }

    public static function isBlank(string : String) : Bool {
        var len : Int = string.length;
        for (i in 0...len) {
            var c : Int = string.charCodeAt(i);
            if (StringTools.isSpace(String.fromCharCode(c), 0) == false) {
                return false;
            }
        }
        return true;
    }

}

