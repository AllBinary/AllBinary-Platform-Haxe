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

import org.allbinary.business.advertisement.AdvertisementsInterface;
import org.allbinary.business.advertisement.search.AdvertisementSearchInterface;

interface AdvertisementCampaignInterface {
    function getName() : String;

    function getComponent() : Any;

    function setName(name : String) : Void;

    function setComponentName(name : String) : Void;

    function search(advertisementSearchInterface : AdvertisementSearchInterface) : AdvertisementsInterface;

}

