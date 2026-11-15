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
package org.allbinary.logic.communication.http.request;

import org.allbinary.logic.io.path.AbPathData;

class HttpRequestUtil {
    private static final instance : HttpRequestUtil = new HttpRequestUtil();
    public static function getInstance() : HttpRequestUtil {
        return HttpRequestUtil.instance;
    }

    public function new() {
    }

    public function getLastSeparatorIndex(requestPath : String) : Int {
        var beginIndex : Int = requestPath.lastIndexOf(AbPathData.getInstance().SEPARATOR);
        if (beginIndex < 0) {
            beginIndex = requestPath.lastIndexOf("\\");
        }
        return beginIndex;
    }

    // throws Exception
    public function generateFileName(requestPath : String) : String {
        var beginIndex : Int = this.getLastSeparatorIndex(requestPath);
        if (beginIndex < 0) {
            return requestPath;
        } else {
            return requestPath.substring(beginIndex + 1);
        }
    }

}

