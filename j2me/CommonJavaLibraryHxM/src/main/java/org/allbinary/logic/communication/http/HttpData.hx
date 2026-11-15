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
package org.allbinary.logic.communication.http;

import org.allbinary.string.CommonSeps;

class HttpData {
    private static final instance : HttpData = new HttpData();
    public static function getInstance() : HttpData {
        return HttpData.instance;
    }

    public final EQUALS : String;
    public final PARAM_SEP : String;
    public final URL_PARAM_SEP : String;
    public final URL_LABEL : String = "Url: ";
    public function new() {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        this.EQUALS = commonSeps.EQUALS;
        this.PARAM_SEP = commonSeps.AMPERSAND;
        this.URL_PARAM_SEP = commonSeps.QUESTION;
    }

}

