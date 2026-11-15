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
 * III
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.logic.visual.transform.template.customizer.includes.meta;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.Validation;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeData;
import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeDataFactory;
import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaData;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class MetaValidation extends Validation implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var label : String;
    private var name : String = null;
    private var httpEquiv : String = null;
    private var content : String;
    public function new(htmlMetaAttributeData : HtmlMetaAttributeData, label : String, attributeValue : String, contentValue : String) {
        super();
        this.label = label;
        if (htmlMetaAttributeData.equals(HtmlMetaAttributeDataFactory.getInstance().HTTP_EQUIV)) {
            this.httpEquiv = attributeValue;
        } else if (htmlMetaAttributeData.equals(HtmlMetaAttributeDataFactory.getInstance().NAME)) {
            this.name = attributeValue;
        }
        this.content = contentValue;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(document : Document) {
        super();
        throw new haxe.Exception(CommonStrings.getInstance().NOT_IMPLEMENTED);
    }

    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            return valid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to validate form", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Validating Form";
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        var htmlMetaAttributeDataFactory : HtmlMetaAttributeDataFactory = HtmlMetaAttributeDataFactory.getInstance();
        hashMap.put(Std.string(HtmlMetaData.getInstance().LABEL), this.label);
        hashMap.put(Std.string(htmlMetaAttributeDataFactory.NAME), this.name);
        hashMap.put(Std.string(htmlMetaAttributeDataFactory.HTTP_EQUIV), this.httpEquiv);
        hashMap.put(Std.string(htmlMetaAttributeDataFactory.CONTENT), this.content);
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = ModDomHelper.createNameValueNodes(document, Std.string(HtmlMetaData.getInstance().NAME), this.toHashMap());
        return node;
    }

}

