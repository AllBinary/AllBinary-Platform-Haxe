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
package org.allbinary.data.tables.advertisement.campaign.internal;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class AdvertisementCampaignInternalEntityFactory {
    private static final CLASSNAME : String = "org.allbinary.data.tables.AdvertisementCampaignEntity";
    public function new() {
    }

    public static function getInstance() : AdvertisementCampaignInternalEntityInterface {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            return (cast new AdvertisementCampaignInternalEntity() : AdvertisementCampaignInternalEntityInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, "AdvertisementCampaignEntityFactory", commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

