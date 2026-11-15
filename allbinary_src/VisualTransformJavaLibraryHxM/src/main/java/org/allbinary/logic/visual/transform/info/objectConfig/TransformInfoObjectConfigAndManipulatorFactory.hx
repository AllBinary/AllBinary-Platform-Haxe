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
package org.allbinary.logic.visual.transform.info.objectConfig;

import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;

class TransformInfoObjectConfigAndManipulatorFactory extends TransformInfoObjectConfigAndManipulatorFactoryBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TransformInfoObjectConfigAndManipulatorFactory = new TransformInfoObjectConfigAndManipulatorFactory();
    public static function getInstance() : TransformInfoObjectConfigAndManipulatorFactory {
        return TransformInfoObjectConfigAndManipulatorFactory.instance;
    }

    public function new() {
        super();
    }

    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface, objectConfigFileAbPath : AbPath) : TransformInfoObjectConfigInterface {
        try {
            var data : String = new CryptFileReader(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION).get(objectConfigFileAbPath);
            return this.getInstance(abeClientInformation, transformInfoInterface, DomDocumentHelper.create(data));
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Could Not Load Object Config", getInstance(), this.commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface) : TransformInfoObjectConfigInterface {
        try {
            var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            if (transformInfoInterface != null && !stringValidationUtil.isEmpty(transformInfoInterface.getStoreName())) {
                return (cast new GenericStoreTransformInfoObjectConfig(abeClientInformation, transformInfoInterface) : TransformInfoObjectConfigInterface);
            } else {
                return (cast new TransformInfoObjectConfig(transformInfoInterface) : TransformInfoObjectConfigInterface);
            }
        } catch (e : haxe.Exception) {
            var error : String = "Failed To Get Instance: ";
            if (transformInfoInterface != null) {
                error = error + transformInfoInterface.getName();
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, getInstance(), commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface, document : Document) : TransformInfoObjectConfigInterface {
        try {
            var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            if (transformInfoInterface != null && !stringValidationUtil.isEmpty(transformInfoInterface.getStoreName())) {
                return (cast new GenericStoreTransformInfoObjectConfig(abeClientInformation, transformInfoInterface, document) : TransformInfoObjectConfigInterface);
            } else {
                return (cast new TransformInfoObjectConfig(transformInfoInterface, document) : TransformInfoObjectConfigInterface);
            }
        } catch (e : haxe.Exception) {
            var error : String = "Failed To Get Instance: ";
            if (transformInfoInterface != null) {
                error = error + transformInfoInterface.getName();
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, getInstance(), "getInstance(document)", e);
            }
            throw e;
        }
    }

}

