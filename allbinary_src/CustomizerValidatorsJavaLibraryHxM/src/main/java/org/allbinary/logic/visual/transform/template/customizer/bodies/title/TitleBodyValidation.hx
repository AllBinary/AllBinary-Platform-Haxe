/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 leIIgal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.logic.visual.transform.template.customizer.bodies.title;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlData;
import org.allbinary.logic.control.validate.Validation;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData;
import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData;
import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleNotRequiredValidation;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class TitleBodyValidation extends Validation implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var body : String;
    private var titleValidation : TitleNotRequiredValidation;
    public function new() {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        }
        final stringUtil : StringUtil = StringUtil.getInstance();
        this.body = stringUtil.EMPTY_STRING;
        this.titleValidation = new TitleNotRequiredValidation();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(document : Document) {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, "Constructor(document)");
        }
        var nodeList : NodeList = document.getElementsByTagName(BodyData.getInstance().NAME);
        for (index in 0...nodeList.getLength()) {
            var aBodyNode : Node = nodeList.item(index);
            var aBodyValueNode : Node = DomSearchHelper.getNode(DomData.VALUE, aBodyNode.getChildNodes());
            this.body = DomNodeHelper.getTextNodeValue(aBodyValueNode);
            var titleNode : Node = DomSearchHelper.getNode(TitleData.getInstance().NAME, aBodyNode.getChildNodes());
            this.titleValidation = new TitleNotRequiredValidation(titleNode);
            if (index > 1) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("To Many Body Nodes", this, this.commonStrings.CONSTRUCTOR);
                }
            }
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF(this.commonStrings.START, this, "Constructor(hashmap)");
        }
        this.getFormData(hashMap);
    }

    // throws Exception
    public function getFormData(hashMap : HashMap) : Void {
        this.body = (cast hashMap.get(BodyData.getInstance().NAME) : String);
        this.titleValidation = new TitleNotRequiredValidation(hashMap);
    }

    public function isValid() : Null<Bool> {
        try {
            var isValid : Null<Bool> = true;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("TitleBodyValidation", this, this.commonStrings.IS_VALID);
            }
            if (!StringValidationUtil.getInstance().isValidNotRequired(this.body, BodyData.getInstance().MIN, AbSqlData.MAXBLOB)) {
                isValid = false;
            }
            if (!this.titleValidation.isValid()) {
                isValid = false;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("TitleBodyValidation: " + isValid, this, this.commonStrings.IS_VALID);
            }
            return isValid;
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
            {
                stringBuffer.append("Error: Data submitted is < ");
                stringBuffer.appendint(Std.int(BodyData.getInstance().MIN));
                stringBuffer.append(" or > ");
                stringBuffer.appendint(Std.int(AbSqlData.MAXBLOB));
            }
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
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
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Title Body: " + this.body, this, "toXmlNode(document)");
        }
        var node : Node = ModDomHelper.createNameValueNodes(document, BodyData.getInstance().NAME, this.body);
        node.appendChild(this.titleValidation.toXmlNode(document));
        return node;
    }

}

