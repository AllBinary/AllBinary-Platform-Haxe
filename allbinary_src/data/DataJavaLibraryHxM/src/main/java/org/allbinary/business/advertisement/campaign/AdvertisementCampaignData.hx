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


class AdvertisementCampaignData {
    private static final instance : AdvertisementCampaignData = new AdvertisementCampaignData();
    public static function getInstance() : AdvertisementCampaignData {
        return AdvertisementCampaignData.instance;
    }

    public function new() {
    }

    public final NAME : String = "ADVERTISEMENTCAMPAIGN_NAME";
    public final DESCRIPTION : String = "ADVERTISEMENTCAMPAIGN_DESCRIPTION";
    public final CONFIG : String = "ADVERTISEMENTCAMPAIGN_CONFIG";
}

