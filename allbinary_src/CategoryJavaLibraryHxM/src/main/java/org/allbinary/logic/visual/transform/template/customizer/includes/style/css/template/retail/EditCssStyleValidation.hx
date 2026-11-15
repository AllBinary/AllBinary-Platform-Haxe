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
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.allbinary.logic.visual.dhtml.style.StyleData;
import org.allbinary.logic.visual.dhtml.style.StylesData;
import org.allbinary.logic.visual.dhtml.style.color.ColorsView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class EditCssStyleValidation extends CssStyleValidation implements ValidationInterface implements DomNodeInterface {
    public function new() {
        super();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(document : Document) {
        super(document);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        super(hashMap);
    }

    public function isValid() : Null<Bool> {
        return super.isValid();
    }

    public function validationInfo() : String {
        return super.validationInfo();
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
        styleNode.appendChild(new ColorsView().toXmlNode(document));
        var size : Int = this.cssStyleElementVector.size();
        for (i in 0...size) {
            var styleDomNodeInterface : DomNodeInterface = (cast cssStyleElementVector.get(i) : DomNodeInterface);
            styleNode.appendChild(styleDomNodeInterface.toXmlNode(document));
        }
        return node;
    }

}

