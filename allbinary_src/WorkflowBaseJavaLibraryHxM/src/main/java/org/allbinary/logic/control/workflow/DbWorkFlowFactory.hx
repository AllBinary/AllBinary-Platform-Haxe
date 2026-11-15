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
import org.allbinary.business.DynamicObjectData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.string.CommonStrings;

class DbWorkFlowFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : DbWorkFlowFactory = new DbWorkFlowFactory();
    public static function getInstance() : DbWorkFlowFactory {
        return DbWorkFlowFactory.instance;
    }

    public function new() {
    }

    // throws Exception, LicensingException
    public function getInstance(abeClientInformation : AbeClientInformationInterface, hashMap : HashMap) : WorkFlowInterface {
        try {
            final className : String = (cast hashMap.get(DynamicObjectData.NAME) : String);
            final params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
            final classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
            classes[0] = Type.getClass(hashMap);
            params[0] = (cast hashMap : Any);
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

}

