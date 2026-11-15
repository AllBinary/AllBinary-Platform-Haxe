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
package org.allbinary.data.tables;

import org.allbinary.string.CommonPhoneStrings;

class TableDataFactory {
    private static final instance : TableDataFactory = new TableDataFactory();
    public static function getInstance() : TableDataFactory {
        return TableDataFactory.instance;
    }

    public final INTEGER_MAX_VALUE_STRING : String = Std.string(Integer.MAX_VALUE);
    public final ZERO_STRING : String = CommonPhoneStrings.getInstance().ZERO;
    public function new() {
    }
}

