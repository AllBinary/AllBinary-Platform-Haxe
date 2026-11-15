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
package org.allbinary.logic.visual.transform;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.data.tables.transform.info.TransformInfoEntity;
import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpFactory;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoObjectFactory;
import org.allbinary.string.CommonStrings;

class TransformFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TransformFactory = new TransformFactory();
    public static function getInstance() : TransformFactory {
        return TransformFactory.instance;
    }

    public function new() {
    }

    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, viewName : String, ownerTransformInfoInterface : TransformInfoInterface) : TransformInterface {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                this.logUtil.putF("Creating Transform: " + viewName, this, this.commonStrings.GET_INSTANCE);
            }
            var ownerTransformInfoHttpInterface : TransformInfoHttpInterface = (cast ownerTransformInfoInterface : TransformInfoHttpInterface);
            var transformInfoEntity : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
            var transformInfoInterface : TransformInfoInterface = transformInfoEntity.get(viewName, ownerTransformInfoHttpInterface.getPropertiesHashMap(), ownerTransformInfoHttpInterface.getPageContext());
            if (transformInfoInterface == null) {
                throw new haxe.Exception("No Such View In DB: " + viewName);
            }
            transformInfoInterface.setChild();
            final anyType : Any = TransformInfoObjectFactory.getInstance().getInstance(abeClientInformation, transformInfoInterface);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                this.logUtil.putF("Created Transform: " + viewName, this, this.commonStrings.GET_INSTANCE);
            }
            return (cast anyType : TransformInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, this.commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, propertiesHashMap : HashMap, pageContext : PageContext) : TransformInterface {
        try {
            final transformInfoData : TransformInfoData = TransformInfoData.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                this.logUtil.putF("Creating Transform: " + propertiesHashMap.get(transformInfoData.NAME), this, this.commonStrings.GET_INSTANCE);
            }
            final transformInfoEntity : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
            var transformInfoInterface : TransformInfoInterface = transformInfoEntity.get((cast propertiesHashMap.get(transformInfoData.NAME) : String), propertiesHashMap, pageContext);
            if (transformInfoInterface != null) {
                transformInfoInterface.override_(propertiesHashMap);
            } else {
                transformInfoInterface = (cast TransformInfoHttpFactory.getInstance(propertiesHashMap, pageContext) : TransformInfoInterface);
            }
            final anyType : Any = TransformInfoObjectFactory.getInstance().getInstance(abeClientInformation, transformInfoInterface);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                this.logUtil.putF("Created Transform: " + propertiesHashMap.get(transformInfoData.NAME), this, this.commonStrings.GET_INSTANCE);
            }
            return (cast anyType : TransformInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Failed To Get Instance: ");
                stringBuffer.append((cast propertiesHashMap.get(TransformInfoData.getInstance().NAME) : String));
                stringBuffer.append("->TransformFactory");
                this.logUtil.put(stringBuffer.toString(), this, this.commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface) : TransformInterface {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                this.logUtil.putF("Creating Transform: " + transformInfoInterface.getName(), this, "getInstance(TransformInfoInterface)");
            }
            final anyType : Any = TransformInfoObjectFactory.getInstance().getInstance(abeClientInformation, transformInfoInterface);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
                this.logUtil.putF("Created Transform: " + transformInfoInterface.getName(), this, "getInstance(TransformInfoInterface)");
            }
            return (cast anyType : TransformInterface);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(TransformInfoInterface)", e);
            }
            throw e;
        }
    }

}

