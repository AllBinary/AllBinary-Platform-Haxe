/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.persistance;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonSeps;

class PlatformRecordIdUtil {
    private static final instance : PlatformRecordIdUtil = new PlatformRecordIdUtil();
    public static function getInstance() : PlatformRecordIdUtil {
        return PlatformRecordIdUtil.instance;
    }

    private final PLATFORM_SHORT_NAME : String = "AND";
    public function getRecordId(abeClientInformation : AbeClientInformationInterface, baseRecordId : String) : String {
        return new StringMaker().append(abeClientInformation.toShortString()).append(CommonSeps.getInstance().UNDERSCORE).append(this.PLATFORM_SHORT_NAME).append(baseRecordId).toString();
    }

    public function new() {
    }
}

