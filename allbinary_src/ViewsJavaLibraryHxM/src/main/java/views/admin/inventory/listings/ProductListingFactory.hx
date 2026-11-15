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
package views.admin.inventory.listings;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchRequest;
import org.allbinary.string.CommonStrings;

class ProductListingFactory {
    public function new() {
    }

    public static function getInstance(searchRequest : SearchRequest) : ProductListingInterface {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            return (cast new views.admin.inventory.listings.ProductListing(searchRequest) : ProductListingInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, "ProductListingFactory", commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

