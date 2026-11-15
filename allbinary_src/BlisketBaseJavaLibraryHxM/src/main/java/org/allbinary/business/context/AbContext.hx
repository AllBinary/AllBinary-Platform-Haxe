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
package org.allbinary.business.context;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class AbContext {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var propertiesHashMap : HashMap;
    private var pageContext : PageContext;
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Properties HashMap: " + propertiesHashMap.toString(), this, this.commonStrings.CONSTRUCTOR);
        }
        this.propertiesHashMap = propertiesHashMap;
        this.pageContext = pageContext;
    }

    public function getWeblisketSession() : WeblisketSessionInterface {
        return new WeblisketSession(this.propertiesHashMap, pageContext);
    }

    public function getPageContext() : PageContext {
        return this.pageContext;
    }

    public function getPropertiesHashMap() : HashMap {
        return this.propertiesHashMap;
    }

}

