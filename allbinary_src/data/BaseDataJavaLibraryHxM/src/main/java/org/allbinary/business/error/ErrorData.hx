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
package org.allbinary.business.error;


class ErrorData {
    private static final instance : ErrorData = new ErrorData();
    public static function getInstance() : ErrorData {
        return ErrorData.instance;
    }

    public function new() {
    }

    public final NAME : String = "ERROR_NAME";
    public final TEXT : String = "ERROR_TEXT";
}

