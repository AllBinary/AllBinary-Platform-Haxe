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
package org.allbinary.business.advertisement.area;


class AdvertisementAreaData {
    private static final instance : AdvertisementAreaData = new AdvertisementAreaData();
    public static function getInstance() : AdvertisementAreaData {
        return AdvertisementAreaData.instance;
    }

    public function new() {
    }

    public final NAME : String = "ADVERTISEMENT_NAME";
    public final DESCRIPTION : String = "ADVERTISEMENT_DESCRIPTION";
    public final CONSTRAINTS : String = "ADVERTISEMENT_CONSTRAINTS";
}

