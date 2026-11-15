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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.string.CommonStrings;

class TransformInfoObjectFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TransformInfoObjectFactory = new TransformInfoObjectFactory();
    public static function getInstance() : TransformInfoObjectFactory {
        return TransformInfoObjectFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface) : TransformInterface {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.putF("Creating View: " + transformInfoInterface.getName(), this, commonStrings.GET_INSTANCE);
            }
            var params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
            var classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
            classes[0] = TransformInfoInterface;
            params[0] = (cast transformInfoInterface : Any);
            final anyType : TransformInterface = (cast AbeFactory.getInstance().getInstance(abeClientInformation, transformInfoInterface.getObjectFile(), classes, params) : TransformInterface);
            if (anyType == null) {
                if (transformInfoInterface != null) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("\nNo Such View Name: ");
                    stringBuffer.append(transformInfoInterface.getName());
                    stringBuffer.append("\nNo Such View Object: ");
                    stringBuffer.append(transformInfoInterface.getObjectFile());
                    throw new haxe.Exception(Std.string(stringBuffer));
                } else {
                    throw new haxe.Exception("No Such View Object since transformInfo is null");
                }
            }
            return anyType;
        } catch (e : LicensingException) {
            var error : String = "Failed To Get Instance: ";
            if (transformInfoInterface != null) {
                error = error + transformInfoInterface.getName();
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(error, this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed To Get Instance: ";
            if (transformInfoInterface != null) {
                error = error + transformInfoInterface.getName();
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(error, this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

}

