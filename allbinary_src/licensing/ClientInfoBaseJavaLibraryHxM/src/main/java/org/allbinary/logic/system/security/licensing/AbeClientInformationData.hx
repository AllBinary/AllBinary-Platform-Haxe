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
package org.allbinary.logic.system.security.licensing;


class AbeClientInformationData {
    private static final instance : AbeClientInformationData = new AbeClientInformationData();
    public static function getInstance() : AbeClientInformationData {
        return AbeClientInformationData.instance;
    }

    public function new() {
    }

    public final KEY : String = "KEY";
    public final NAME : String = "NAME";
    public final VERSION : String = "VERSION";
    public final SPECIALNAME : String = "SPECIALNAME";
    public final LICENSEID : String = "LICENSEID";
    public final LICENSE_TYPE : String = "LICENSETYPE";
    public final PREVIOUSLICENSEID : String = "PREVIOUSLICENSEID";
    public final OSNAME : String = "OSNAME";
    public final OSARCH : String = "OSARCH";
    public final OSVERSION : String = "OSVERSION";
    public final OS : String = "OS";
    public final HARDWARE : String = "HARDWARE";
    public final LICENSESERVERS : String = "LICENSESERVERS";
    public final NEWLICENSE : String = "NEWLICENSE";
    public final ISNEW : String = "ISNEW";
    public final SPECIAL : String = "SPECIAL";
}

