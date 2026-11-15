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

class StoreTagWorkFlowFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : StoreTagWorkFlowFactory = new StoreTagWorkFlowFactory();
    public static function getInstance() : StoreTagWorkFlowFactory {
        return StoreTagWorkFlowFactory.instance;
    }

    public function new() {
    }

    // throws Exception, LicensingException
    public function getInstance(abeClientInformation : AbeClientInformationInterface, propertiesHashMap : HashMap, pageContext : PageContext) : StoreWorkFlowInterface {
        try {
            var workFlowClassName : String = (cast propertiesHashMap.get(DynamicObjectData.NAME) : String);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Creating WorkFlow: ");
                stringBuffer.append(workFlowClassName);
                stringBuffer.append("->");
                stringBuffer.append(Type.getClassName(Type.getClass(StoreTagWorkFlowFactory.instance)));
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.putF(Std.string(stringBuffer), this, commonStrings.GET_INSTANCE);
            }
            var params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            var classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            classes[0] = Type.getClass(propertiesHashMap);
            classes[1] = AbeFactory.getInstance().getClass(abeClientInformation, "javax.servlet.jsp.PageContext");
            params[0] = (cast propertiesHashMap : Any);
            params[1] = (cast pageContext : Any);
            return (cast AbeFactory.getInstance().getInstance(abeClientInformation, workFlowClassName, classes, params) : StoreWorkFlowInterface);
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                var workFlowClassName : String = (cast propertiesHashMap.get(DynamicObjectData.NAME) : String);
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Error Creating WorkFlow: ");
                stringBuffer.append(workFlowClassName);
                stringBuffer.append("->");
                stringBuffer.append(Type.getClassName(Type.getClass(StoreTagWorkFlowFactory.instance)));
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(Std.string(stringBuffer), this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                var workFlowClassName : String = (cast propertiesHashMap.get(DynamicObjectData.NAME) : String);
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Error Creating WorkFlow: ");
                stringBuffer.append(workFlowClassName);
                stringBuffer.append("->");
                stringBuffer.append(Type.getClassName(Type.getClass(StoreTagWorkFlowFactory.instance)));
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(Std.string(stringBuffer), this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

}

