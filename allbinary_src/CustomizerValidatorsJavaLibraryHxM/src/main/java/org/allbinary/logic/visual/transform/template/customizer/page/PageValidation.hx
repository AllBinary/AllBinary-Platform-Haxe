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
package org.allbinary.logic.visual.transform.template.customizer.page;

//import java.util.HashMap;
import org.allbinary.business.page.PageData;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.Validation;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData;
import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleValidation;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class PageValidation extends Validation implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var title : TitleValidation;
    public function new() {
        super();
        this.title = new TitleValidation();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(document : Document) {
        super();
        var node : Node = DomSearchHelper.getNode(TitleData.getInstance().NAME, document.getElementsByTagName(PageData.getInstance().NAME));
        this.title = new TitleValidation(node);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        super();
        this.getFormData(hashMap);
    }

    public function getFormData(hashMap : HashMap) : Void {
        this.title = new TitleValidation(hashMap);
    }

    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("PageValidation", this, this.commonStrings.IS_VALID);
            }
            if (!this.title.isValid()) {
                valid = false;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("PageValidation: " + valid, this, this.commonStrings.IS_VALID);
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
            var stringBuffer : StringMaker = new StringMaker();
            if (!this.title.isValid()) {
                stringBuffer.append(this.title.validationInfo());
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
        var node : Node = document.createElement(PageData.getInstance().NAME);
        node.appendChild(this.title.toXmlNode(document));
        return node;
    }

}

