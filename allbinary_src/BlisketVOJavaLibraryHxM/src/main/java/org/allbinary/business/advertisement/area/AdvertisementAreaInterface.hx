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


interface AdvertisementAreaInterface {
    function getName() : String;

    function getStoreName() : String;

    function getDescription() : String;

    function getConstraints() : AdvertisementAreaConstraintsInterface;

    function getCampaign() : String;

    function setName(name : String) : Void;

    function setStoreName(storeName : String) : Void;

    function setDescription(description : String) : Void;

    function setConstraints(advertisementConstraintsInterface : AdvertisementAreaConstraintsInterface) : Void;

    function setCampaign(campaign : String) : Void;

}

