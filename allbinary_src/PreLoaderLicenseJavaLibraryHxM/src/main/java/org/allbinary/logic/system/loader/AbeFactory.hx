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
package org.allbinary.logic.system.loader;

//import java.lang.reflect.Constructor;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.anyType.ConstructorUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.AbKeys;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.string.CommonSeps;

class AbeFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : AbeFactory = new AbeFactory();
    public static function getInstance() : AbeFactory {
        return AbeFactory.instance;
    }

    private var useCustomLoader : Bool = false;
    public function new() {
    }

    // throws LicensingException
    // synchronized
    public function getInstance(abeClientInformation : AbeClientInformationInterface, className : String) : Any {
        try {
            return this.getClass(abeClientInformation, className).newInstance();
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                this.logUtil.put("Failure for: " + className, this, "getInstance(classname)", e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                this.logUtil.put("Failure for: " + className, this, "getInstance(classname)", e);
            }
            return null;
        }
    }

    // throws LicensingException
    // synchronized
    public function getInstance(abeClientInformation : AbeClientInformationInterface, className : String, classes : haxe.ds.Vector<Class<Dynamic>>, params : haxe.ds.Vector<Any>) : Any {
        var constructor : Constructor = null;
        try {
            var parent : ClassLoader = WebappClassLoaderInfo.getLoader();
            if (this.useCustomLoader) {
                var loader : ClassLoader = new AbeClassLoader(parent, AbKeys.getInstance().getKey(abeClientInformation, className));
                var myClass : Class<Dynamic> = loader.loadClass(className);
                constructor = myClass.getConstructor(classes);
                return constructor.newInstance(params);
            } else {
                var myClass : Class<Dynamic> = parent.loadClass(className);
                constructor = myClass.getConstructor(classes);
                return constructor.newInstance(params);
            }
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Failure for: ");
                stringBuffer.append(className);
                stringBuffer.append(CommonSeps.getInstance().SPACE);
                stringBuffer.append(ConstructorUtil.view(constructor, CommonSeps.getInstance().NEW_LINE));
                this.logUtil.put(stringBuffer.toString(), this, "getInstance(className,params)", e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Failure for: ");
                stringBuffer.append(className);
                stringBuffer.append(CommonSeps.getInstance().SPACE);
                stringBuffer.append(ConstructorUtil.view(constructor, CommonSeps.getInstance().NEW_LINE));
                this.logUtil.put(stringBuffer.toString(), this, "getInstance(className,params)", e);
            }
            return null;
        }
    }

    // throws LicensingException
    // synchronized
    public function getClass(abeClientInformation : AbeClientInformationInterface, className : String) : Class<Dynamic> {
        try {
            var parent : ClassLoader = WebappClassLoaderInfo.getLoader();
            if (this.useCustomLoader) {
                var loader : ClassLoader = new AbeClassLoader(parent, AbKeys.getInstance().getKey(abeClientInformation, className));
                var c : Class<Dynamic> = loader.loadClass(className);
                return c;
            } else {
                var c : Class<Dynamic> = parent.loadClass(className);
                return c;
            }
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                this.logUtil.put("Failure for: " + className, this, "getClass(className)", e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LOADERERROR)) {
                this.logUtil.put("Failure for: " + className, this, "getClass(className)", e);
            }
            return null;
        }
    }

}

