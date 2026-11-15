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
package org.allbinary.logic.visual.transform.template;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.data.tables.transform.info.TransformInfoEntity;
import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoObjectFactory;

class TransformTemplateFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TransformTemplateFactory = new TransformTemplateFactory();
    public static function getInstance() : TransformTemplateFactory {
        return TransformTemplateFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, templateName : String, propertiesHashMap : HashMap, pageContext : PageContext) : TransformTemplateInterface {
        try {
            final transformInfoEntity : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
            final transformInfoInterface : TransformInfoInterface = transformInfoEntity.get(templateName, propertiesHashMap, pageContext);
            return (cast TransformInfoObjectFactory.getInstance().getInstance(abeClientInformation, transformInfoInterface) : TransformTemplateInterface);
        } catch (e : haxe.Exception) {
            var error : String = "Failed To Get Instance";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                this.logUtil.put(error + templateName + "->TemplateFactory", this, "getInstance(viewName, HashMap, PageContext)", e);
            }
            throw e;
        }
    }

}

