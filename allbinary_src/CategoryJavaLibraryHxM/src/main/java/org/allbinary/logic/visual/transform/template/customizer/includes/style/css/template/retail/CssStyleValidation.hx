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
package org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.Validation;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.dhtml.style.StyleData;
import org.allbinary.logic.visual.dhtml.style.StylesData;
import org.allbinary.logic.visual.dhtml.style.StylesValidationFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class CssStyleValidation extends Validation implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var cssStyleElementVector : BasicArrayList;
    public function new() {
        super();
        this.cssStyleElementVector = new BasicArrayListD();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(document : Document) {
        super();
        this.cssStyleElementVector = StylesValidationFactory.getInstance().getInstance(document);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        super();
        this.cssStyleElementVector = StylesValidationFactory.getInstance(hashMap);
    }

    public function isValid() : Null<Bool> {
        try {
            var isValid : Null<Bool> = true;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.IS_VALID);
            }
            var size : Int = this.cssStyleElementVector.size();
            for (i in 0...size) {
                var styleValidationInterface : ValidationInterface = (cast this.cssStyleElementVector.get(i) : ValidationInterface);
                if (!styleValidationInterface.isValid()) {
                    isValid = false;
                }
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("End: " + isValid, this, this.commonStrings.IS_VALID);
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
            return Std.string(stringBuffer);
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
        var node : Node = document.createElement(StylesData.getInstance().NAME);
        var styleNode : Node = document.createElement(StyleData.getInstance().NAME);
        node.appendChild(styleNode);
        var size : Int = this.cssStyleElementVector.size();
        for (i in 0...size) {
            var styleDomNodeInterface : DomNodeInterface = (cast this.cssStyleElementVector.get(i) : DomNodeInterface);
            styleNode.appendChild(styleDomNodeInterface.toXmlNode(document));
        }
        return node;
    }

}

