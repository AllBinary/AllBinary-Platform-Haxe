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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.advertisement.AdvertisementInterface;
import org.allbinary.business.advertisement.AdvertisementsInterface;
import org.allbinary.business.advertisement.search.AdvertisementSearchInterface;

class AdvertisementCampaigns implements AdvertisementCampaignsInterface {
    private var advertisementsVector : BasicArrayList;
    public function new(vector : BasicArrayList) {
        this.advertisementsVector = this.advertisementsVector;
    }

    public function add(advertisementInterface : AdvertisementInterface) : Void {
        this.advertisementsVector.add(advertisementInterface);
    }

    public function get(index : Int) : AdvertisementInterface {
        return (cast this.advertisementsVector.get(index) : AdvertisementInterface);
    }

    public function size() : Int {
        return this.advertisementsVector.size();
    }

    public function isEnabled() : Bool {
        return true;
    }

    public function search(advertisementSearchInterface : AdvertisementSearchInterface) : AdvertisementsInterface {
        return null;
    }

}

