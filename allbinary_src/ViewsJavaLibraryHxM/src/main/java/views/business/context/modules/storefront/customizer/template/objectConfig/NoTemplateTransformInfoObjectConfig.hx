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
package views.business.context.modules.storefront.customizer.template.objectConfig;

//import java.util.HashMap;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.visual.transform.info.TransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData;
import org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil;
import org.w3c.dom.Document;

class NoTemplateTransformInfoObjectConfig extends TransformInfoObjectConfig {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, document : Document) {
        super(transformInfoInterface, document);
        this.setDocument(this.generate(this.toXmlDoc()));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, name : String, type : String) {
        super(transformInfoInterface, name, type);
        this.setDocument(this.generate(this.toXmlDoc()));
    }

    // throws Exception
    public function generate(objectConfigDocument : Document) : Document {
        var docString : String = XmlDocumentHelper.toString(objectConfigDocument);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Initial ObjectConfig: " + docString, this, "generate()");
        }
        var storeName : String = this.getTransformInfoInterface().getStoreName();
        var viewName : String = this.getTransformInfoInterface().getName();
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        final VARKEY : String = TransformInfoObjectConfigData.getInstance().VARKEY;
        hashMap.put(VARKEY + StoreFrontData.getInstance().NAME, storeName);
        hashMap.put(VARKEY + TransformInfoData.getInstance().OWNER, viewName);
        var pageName : String = TransformTemplateCustomizerUtil.getInstance().getPageNameHack(this.getTransformInfoInterface().getName(), this.getTransformInfoInterface().getStoreName());
        hashMap.put(VARKEY + TransformInfoData.getInstance().PARTIAL, pageName);
        var replace : Replace = new Replace(hashMap);
        var newObjectConfigDocument : Document = DomDocumentHelper.create(replace.all(docString));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Final ObjectConfig: " + XmlDocumentHelper.toString(newObjectConfigDocument), this, "generate()");
        }
        return newObjectConfigDocument;
    }

}

