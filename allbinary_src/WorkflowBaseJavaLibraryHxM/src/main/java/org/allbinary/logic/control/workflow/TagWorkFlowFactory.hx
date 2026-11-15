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
package org.allbinary.logic.control.workflow;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.DynamicObjectData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.string.CommonStrings;

class TagWorkFlowFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TagWorkFlowFactory = new TagWorkFlowFactory();
    public static function getInstance() : TagWorkFlowFactory {
        return TagWorkFlowFactory.instance;
    }

    public function new() {
    }

    // throws Exception, LicensingException
    public function getInstance(abeClientInformation : AbeClientInformationInterface, propertiesHashMap : HashMap, pageContext : PageContext) : WorkFlowInterface {
        try {
            final workFlowClassName : String = (cast propertiesHashMap.get(DynamicObjectData.NAME) : String);
            final params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            final classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            classes[0] = Type.getClass(propertiesHashMap);
            classes[1] = AbeFactory.getInstance().getClass(abeClientInformation, "javax.servlet.jsp.PageContext");
            params[0] = (cast propertiesHashMap : Any);
            params[1] = (cast pageContext : Any);
            return (cast AbeFactory.getInstance().getInstance(abeClientInformation, workFlowClassName, classes, params) : WorkFlowInterface);
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final workFlowClassName : String = (cast propertiesHashMap.get(DynamicObjectData.NAME) : String);
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Failed To Get Instance: ");
                stringBuffer.append(workFlowClassName);
                stringBuffer.append("->");
                stringBuffer.append(Type.getClassName(Type.getClass(TagWorkFlowFactory.instance)));
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(stringBuffer.toString(), this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final workFlowClassName : String = (cast propertiesHashMap.get(DynamicObjectData.NAME) : String);
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Failed To Get Instance: ");
                stringBuffer.append(workFlowClassName);
                stringBuffer.append("->");
                stringBuffer.append(Type.getClassName(Type.getClass(TagWorkFlowFactory.instance)));
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(stringBuffer.toString(), this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

}

