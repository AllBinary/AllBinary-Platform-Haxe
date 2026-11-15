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
package org.allbinary.business.advertisement.campaign;

//import java.util.HashMap;
import org.allbinary.business.DynamicObjectData;
import org.allbinary.business.advertisement.AdvertisementsInterface;
import org.allbinary.business.advertisement.search.AdvertisementSearchInterface;

class AdvertisementCampaign implements AdvertisementCampaignInterface {
    private var hashMap : HashMap;
    public function new(hashMap : HashMap) {
        this.hashMap = hashMap;
    }

    public function getComponent() : Any {
        return null;
    }

    public function getName() : String {
        return (cast this.hashMap.get(AdvertisementCampaignData.getInstance().NAME) : String);
    }

    public function setComponentName(name : String) : Void {
        this.hashMap.put(DynamicObjectData.NAME, name);
    }

    public function setName(name : String) : Void {
        this.hashMap.put(AdvertisementCampaignData.getInstance().NAME, name);
    }

    public function search(advertisementSearchInterface : AdvertisementSearchInterface) : AdvertisementsInterface {
        return null;
    }

}

