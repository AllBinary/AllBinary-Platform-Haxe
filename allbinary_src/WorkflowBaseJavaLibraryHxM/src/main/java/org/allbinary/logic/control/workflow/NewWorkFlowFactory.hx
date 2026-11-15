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
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.string.CommonStrings;

class NewWorkFlowFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : NewWorkFlowFactory = new NewWorkFlowFactory();
    public static function getInstance() : NewWorkFlowFactory {
        return NewWorkFlowFactory.instance;
    }

    public function new() {
    }

    // throws Exception, LicensingException
    public function getInstance(abeClientInformation : AbeClientInformationInterface, hashMap : HashMap, pageContext : PageContext) : WorkFlowInterface {
        try {
            final className : String = (cast hashMap.get(DynamicObjectData.NAME) : String);
            final params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            final classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            classes[0] = Type.getClass(hashMap);
            classes[1] = AbeFactory.getInstance().getClass(abeClientInformation, "javax.servlet.jsp.PageContext");
            params[0] = (cast hashMap : Any);
            params[1] = (cast pageContext : Any);
            final anyType : Any = AbeFactory.getInstance().getInstance(abeClientInformation, className, classes, params);
            return (cast new WorkFlowWrapper(anyType) : WorkFlowInterface);
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(HashMap)", e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(HashMap)", e);
            }
            throw e;
        }
    }

    // throws Exception, LicensingException
    public function getInstance(abeClientInformation : AbeClientInformationInterface, className : String) : WorkFlowInterface {
        try {
            final stringUtil : StringUtil = StringUtil.getInstance();
            if (className != null && Reflect.compare(className, stringUtil.EMPTY_STRING) != 0) {
                final anyType : Any = AbeFactory.getInstance().getInstance(abeClientInformation, className, null, null);
                return (cast new WorkFlowWrapper(anyType) : WorkFlowInterface);
            } else {
                throw new haxe.Exception("No WorkFlow ClassName");
            }
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

}

