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
package org.allbinary.logic.io.path;

import org.allbinary.logic.io.file.FilePathData;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;

class AbPathData {
    private static final instance : AbPathData = new AbPathData();
    public static function getInstance() : AbPathData {
        return AbPathData.instance;
    }

    public final EXTENSION_SEP : String = CommonSeps.getInstance().PERIOD;
    public final SEPARATORCHAR : Int = "/".code;
    public final SEPARATOR : String = CommonSeps.getInstance().FORWARD_SLASH;
    public function new() {
    }

}

