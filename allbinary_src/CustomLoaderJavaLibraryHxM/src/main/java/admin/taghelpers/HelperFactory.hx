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
package admin.taghelpers;

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.string.CommonStrings;

class HelperFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    // throws LicensingException
    public static function getInstance(abeClientInformation : AbeClientInformationInterface, factoryName : String, className : String, hashMap : HashMap, httpServletRequest : HttpServletRequest) : Any {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            var params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            var classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            final abeFactory : AbeFactory = AbeFactory.getInstance();
            classes[0] = Type.getClass(hashMap);
            classes[1] = abeFactory.getClass(abeClientInformation, "javax.servlet.http.HttpServletRequest");
            params[0] = (cast hashMap : Any);
            params[1] = (cast httpServletRequest : Any);
            var anyType : Any = abeFactory.getInstance(abeClientInformation, className, classes, params);
            return anyType;
        } catch (e : LicensingException) {
            var error : String = "Failed To Get Instance Args: HashMap=" + hashMap.toString() + " HttpServletRequest=" + httpServletRequest;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                logUtil.put(error, factoryName + "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed To Get Instance";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                logUtil.put(error, factoryName + "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e);
            }
            return null;
        }
    }

    // throws LicensingException
    public static function getInstance(abeClientInformation : AbeClientInformationInterface, factoryName : String, className : String, hashMap : HashMap, pageContext : PageContext) : Any {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            var params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            var classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            final abeFactory : AbeFactory = AbeFactory.getInstance();
            classes[0] = Type.getClass(hashMap);
            classes[1] = abeFactory.getClass(abeClientInformation, "javax.servlet.jsp.PageContext");
            params[0] = (cast hashMap : Any);
            params[1] = (cast pageContext : Any);
            var anyType : Any = abeFactory.getInstance(abeClientInformation, className, classes, params);
            return anyType;
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                var error : String = "Failed To Get Instance Args: HashMap=" + hashMap.toString() + " PageContext=" + pageContext;
                logUtil.put(error, factoryName + "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, factoryName + "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e);
            }
            return null;
        }
    }

    // throws LicensingException
    public static function getInstance(abeClientInformation : AbeClientInformationInterface, factoryName : String, className : String, hashMap : HashMap, specialhashMap : HashMap, pageContext : PageContext) : Any {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            var params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...3) null]);
            var classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...3) null]);
            final abeFactory : AbeFactory = AbeFactory.getInstance();
            classes[0] = Type.getClass(hashMap);
            classes[1] = Type.getClass(specialhashMap);
            classes[2] = abeFactory.getClass(abeClientInformation, "javax.servlet.jsp.PageContext");
            params[0] = (cast hashMap : Any);
            params[1] = (cast specialhashMap : Any);
            params[2] = (cast pageContext : Any);
            var anyType : Any = abeFactory.getInstance(abeClientInformation, className, classes, params);
            return anyType;
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                var error : String = "Failed To Get Instance Args: HashMap=" + hashMap.toString() + " PageContext=" + pageContext;
                logUtil.put(error, factoryName + "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, factoryName + "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e);
            }
            return null;
        }
    }

    // throws LicensingException
    public static function getInstance(abeClientInformation : AbeClientInformationInterface, factoryName : String, className : String) : Any {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            var anyType : Any = AbeFactory.getInstance().getInstance(abeClientInformation, className);
            return anyType;
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, factoryName + "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, factoryName + "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", e);
            }
            return null;
        }
    }

}

