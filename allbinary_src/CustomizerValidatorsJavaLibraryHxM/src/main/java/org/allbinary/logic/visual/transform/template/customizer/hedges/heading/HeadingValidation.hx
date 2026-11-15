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
package org.allbinary.logic.visual.transform.template.customizer.hedges.heading;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.Validation;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoData;
import org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoValidation;
import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData;
import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleValidation;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class HeadingValidation extends Validation implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var title : TitleValidation;
    private var logo : LogoValidation;
    public function new() {
        super();
        this.title = new TitleValidation();
        this.logo = new LogoValidation();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(document : Document) {
        super();
        var headingNodeList : NodeList = document.getElementsByTagName(HeadingData.NAME);
        var titleNode : Node = DomSearchHelper.getNode(TitleData.getInstance().NAME, headingNodeList.item(0).getChildNodes());
        var logoNode : Node = DomSearchHelper.getNode(LogoData.getInstance().NAME, headingNodeList.item(0).getChildNodes());
        this.title = new TitleValidation(titleNode);
        this.logo = new LogoValidation(logoNode);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        super();
        this.getFormData(hashMap);
    }

    // throws Exception
    public function getFormData(hashMap : HashMap) : Void {
        this.title = new TitleValidation(hashMap);
        this.logo = new LogoValidation(hashMap);
    }

    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            var titleValid : Null<Bool> = true;
            var logoValid : Null<Bool> = true;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.IS_VALID);
            }
            if (!this.title.isValid()) {
                titleValid = false;
            }
            if (!this.logo.isValid()) {
                logoValid = false;
            } else {
                this.logo.processLogoFile();
            }
            if (!titleValid && !logoValid) {
                valid = false;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("HeadingValidation: " + valid, this, this.commonStrings.IS_VALID);
            }
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
            var valid : Null<Bool> = true;
            var titleValid : Null<Bool> = true;
            var logoValid : Null<Bool> = true;
            var stringBuffer : StringMaker = new StringMaker();
            if (!this.title.isValid()) {
                titleValid = false;
            }
            if (!this.logo.isValid()) {
                logoValid = false;
            }
            if (!titleValid && !logoValid) {
                valid = false;
            }
            if (!valid) {
                stringBuffer.append("Include a title and/or logo for the header.");
            }
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

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(HeadingData.NAME);
        node.appendChild(this.logo.toXmlNode(document));
        node.appendChild(this.title.toXmlNode(document));
        return node;
    }

}

