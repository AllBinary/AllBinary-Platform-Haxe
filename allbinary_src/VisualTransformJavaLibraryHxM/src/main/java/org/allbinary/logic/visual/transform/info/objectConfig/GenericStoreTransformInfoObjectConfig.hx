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

//import java.util.HashMap;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.RootTransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoHttp;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.template.TransformTemplateFactory;
import org.allbinary.logic.visual.transform.template.TransformTemplateInterface;
import org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil;
import org.allbinary.string.CommonSeps;
import org.w3c.dom.Document;

class GenericStoreTransformInfoObjectConfig extends TransformInfoObjectConfig {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final abeClientInformation : AbeClientInformationInterface;
    public function new(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.abeClientInformation = abeClientInformation;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface, document : Document) {
        super(transformInfoInterface, document);
        this.abeClientInformation = abeClientInformation;
        this.setDocument(this.generate(this.toXmlDoc()));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface, name : String, type : String) {
        super(transformInfoInterface, name, type);
        this.abeClientInformation = abeClientInformation;
        this.setDocument(this.generate(this.toXmlDoc()));
    }

    // throws Exception
    public function generate(objectConfigDocument : Document) : Document {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("TransformInfo: ");
            if (this.getTransformInfoInterface() != null) {
                stringBuffer.append(this.getTransformInfoInterface().getName());
            } else {
                stringBuffer.append("No Owner!?#@");
            }
            this.logUtil.putF(stringBuffer.toString(), this, "generate()");
        }
        final transformInfoHttpStoreInterface : TransformInfoHttp = (cast this.getTransformInfoInterface() : TransformInfoHttp);
        final objectConfigDocumentString : String = XmlDocumentHelper.toString(objectConfigDocument);
        final replaceHashMap : HashMap = this.createReplaceHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString);
        return this.generate(objectConfigDocumentString, replaceHashMap);
    }

    // throws Exception
    private function createReplaceHashMap(transformInfoHttpStoreInterface : TransformInfoHttp, objectConfigDocumentString : String) : HashMap {
        var storeName : String = transformInfoHttpStoreInterface.getStoreName();
        final hashMap : HashMap = this.createHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString);
        final transformInfoObjectConfigData : TransformInfoObjectConfigData = TransformInfoObjectConfigData.getInstance();
        hashMap.put(transformInfoObjectConfigData.VARKEY + StoreFrontData.getInstance().NAME, storeName);
        final pageName : String = TransformTemplateCustomizerUtil.getInstance().getPageNameHack(this.getTransformInfoInterface().getName(), storeName);
        hashMap.put(transformInfoObjectConfigData.VARKEY + TransformInfoData.getInstance().PARTIAL, pageName);
        return hashMap;
    }

    // throws Exception
    private function createHashMap(transformInfoHttpStoreInterface : TransformInfoHttp, objectConfigDocumentString : String) : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        var storeName : String = transformInfoHttpStoreInterface.getStoreName();
        var propertiesHashMap : HashMap = transformInfoHttpStoreInterface.getPropertiesHashMap();
        var templateNameOverride : String = StringUtil.getInstance().getNonNull((cast propertiesHashMap.get(TransformInfoData.getInstance().PARTIAL) : String));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("TemplateNameOverride: " + templateNameOverride, this, "generate()");
        }
        var templateNameStringBuffer : StringMaker = new StringMaker();
        templateNameStringBuffer.append(storeName);
        templateNameStringBuffer.append(templateNameOverride);
        templateNameStringBuffer.append(CommonSeps.getInstance().SPACE);
        templateNameStringBuffer.append(RootTransformInfoData.NAME);
        var templateNameKey : String = TransformInfoObjectConfigData.getInstance().VARKEY + TransformInfoData.getInstance().OWNER;
        if (objectConfigDocumentString.indexOf(templateNameKey) != -1) {
            var templateInterface : TransformTemplateInterface = TransformTemplateFactory.getInstance().getInstance(this.abeClientInformation, templateNameStringBuffer.toString(), transformInfoHttpStoreInterface.getPropertiesHashMap(), transformInfoHttpStoreInterface.getPageContext());
            var selectedTemplate : String = templateInterface.getName();
            hashMap.put(templateNameKey, selectedTemplate);
        }
        return hashMap;
    }

    // throws Exception
    private function generate(objectConfigDocumentString : String, hashMap : HashMap) : Document {
        var replace : Replace = new Replace(hashMap);
        var newObjectConfigDocument : Document = DomDocumentHelper.create(replace.all(objectConfigDocumentString));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Final ObjectConfig: " + XmlDocumentHelper.toString(newObjectConfigDocument), this, "generate()");
        }
        return newObjectConfigDocument;
    }

}

