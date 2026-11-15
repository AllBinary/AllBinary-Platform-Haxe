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
package org.allbinary.logic.visual.transform.info;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonStrings;

class TransformInfoHttpFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance(propertiesHashMap : HashMap, pageContext : PageContext) : TransformInfoInterface {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            var weblisketSession : WeblisketSession = new WeblisketSession(propertiesHashMap, pageContext);
            if (!StringValidationUtil.getInstance().isEmpty(weblisketSession.getStoreName())) {
                var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(weblisketSession.getStoreName());
                if (storeFrontInterface != null) {
                    return (cast new TransformInfoHttpStore(storeFrontInterface, propertiesHashMap, pageContext) : TransformInfoInterface);
                } else {
                    throw new haxe.Exception("No StoreFront with: " + weblisketSession.getStoreName());
                }
            } else {
                return (cast new TransformInfoHttpContext(propertiesHashMap, pageContext) : TransformInfoInterface);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, "TransformInfoFactory", commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

}

