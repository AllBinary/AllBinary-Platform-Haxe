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
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class TransformInfoHttpComposite {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var transformInfoInterface : TransformInfoHttpInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, this.commonStrings.CONSTRUCTOR);
        }
        this.transformInfoInterface = (cast transformInfoInterface : TransformInfoHttpInterface);
    }

    // throws Exception
    public function getTransformInfoInterface() : TransformInfoInterface {
        return this.transformInfoInterface;
    }

    public function getWeblisketSession() : WeblisketSession {
        return new WeblisketSession(this.getPropertiesHashMap(), this.getPageContext());
    }

    public function getPageContext() : PageContext {
        return this.transformInfoInterface.getPageContext();
    }

    public function getPropertiesHashMap() : HashMap {
        return this.transformInfoInterface.getPropertiesHashMap();
    }

}

