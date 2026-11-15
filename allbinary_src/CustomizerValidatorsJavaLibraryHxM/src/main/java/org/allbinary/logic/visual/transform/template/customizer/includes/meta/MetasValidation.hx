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
 * II
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.logic.visual.transform.template.customizer.includes.meta;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.Validation;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeDataFactory;
import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeValuesData;
import org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetasData;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class MetasValidation extends Validation implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var storeFrontInterface : StoreFrontInterface;
    private var metaValidationVector : BasicArrayList;
    public function new(storeName : String) {
        super();
        this.storeFrontInterface = StoreFrontFactory.getInstance(storeName);
        this.metaValidationVector = new BasicArrayListD();
        var contentValue : String = this.storeFrontInterface.getName() + " E-Commerce Site";
        var keywordsMetaValidation : MetaValidation = new MetaValidation(HtmlMetaAttributeDataFactory.getInstance().NAME, "Keywords", HtmlMetaAttributeValuesData.getInstance().KEYWORDS, contentValue);
        var abstractMetaValidation : MetaValidation = new MetaValidation(HtmlMetaAttributeDataFactory.getInstance().NAME, "Abstract", HtmlMetaAttributeValuesData.getInstance().ABSTRACT, contentValue);
        var descriptionMetaValidation : MetaValidation = new MetaValidation(HtmlMetaAttributeDataFactory.getInstance().NAME, "Description", HtmlMetaAttributeValuesData.getInstance().DESCRIPTION, contentValue);
        this.metaValidationVector.add(keywordsMetaValidation);
        this.metaValidationVector.add(abstractMetaValidation);
        this.metaValidationVector.add(descriptionMetaValidation);
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
            return stringBuffer.toString();
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

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(HtmlMetasData.getInstance().NAME);
        var metaArray : haxe.ds.Vector<MetaValidation> = (cast this.metaValidationVector.toArrayType(haxe.ds.Vector.fromArrayCopy([for (index in 0...this.metaValidationVector.size()) null])) : haxe.ds.Vector<MetaValidation>);
        var size : Int = metaArray.length;
        for (i in 0...size) {
            var metaValidation : MetaValidation = metaArray[i];
            node.appendChild(metaValidation.toXmlNode(document));
        }
        return node;
    }

}

