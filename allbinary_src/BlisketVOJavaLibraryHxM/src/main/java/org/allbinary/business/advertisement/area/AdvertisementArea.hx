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

//import java.util.HashMap;
import org.allbinary.business.advertisement.campaign.AdvertisementCampaignData;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.w3c.dom.Document;

class AdvertisementArea implements AdvertisementAreaInterface {
    private var name : String;
    private var storeName : String;
    private var description : String;
    private var advertisementAreaConstraintsInterface : AdvertisementAreaConstraintsInterface;
    private var campaign : String;
    public function new(hashMap : HashMap) {
        this.name = (cast hashMap.get(AdvertisementAreaData.getInstance().NAME) : String);
        this.storeName = (cast hashMap.get(StoreFrontData.getInstance().NAME) : String);
        this.description = (cast hashMap.get(AdvertisementAreaData.getInstance().DESCRIPTION) : String);
        var constraintsDomString : String = (cast hashMap.get(AdvertisementAreaData.getInstance().CONSTRAINTS) : String);
        var document : Document = DomDocumentHelper.create(constraintsDomString);
        this.advertisementAreaConstraintsInterface = new AdvertisementAreaConstraints(document);
        this.campaign = (cast hashMap.get(AdvertisementCampaignData.getInstance().NAME) : String);
    }

    public function getName() : String {
        return this.name;
    }

    public function getStoreName() : String {
        return this.storeName;
    }

    public function getDescription() : String {
        return this.description;
    }

    public function getConstraints() : AdvertisementAreaConstraintsInterface {
        return this.advertisementAreaConstraintsInterface;
    }

    public function getCampaign() : String {
        return this.campaign;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function setStoreName(storeName : String) : Void {
        this.storeName = storeName;
    }

    public function setDescription(description : String) : Void {
        this.description = description;
    }

    public function setConstraints(advertisementConstraintsInterface : AdvertisementAreaConstraintsInterface) : Void {
        this.advertisementAreaConstraintsInterface = this.advertisementAreaConstraintsInterface;
    }

    public function setCampaign(campaign : String) : Void {
        this.campaign = campaign;
    }

}

