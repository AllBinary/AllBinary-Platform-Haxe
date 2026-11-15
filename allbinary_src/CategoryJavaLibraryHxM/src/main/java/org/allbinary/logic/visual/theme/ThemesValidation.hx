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
package org.allbinary.logic.visual.theme;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.control.validate.Validation;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class ThemesValidation extends Validation implements DomNodeInterface {
    private var themeVector : BasicArrayList;
    public function new() {
        super();
        this.themeVector = new BasicArrayListD();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        super();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        super();
    }

    public function isValid() : Null<Bool> {
        return true;
    }

    public function validationInfo() : String {
        return null;
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(ThemesData.getInstance().NAME);
        var size : Int = this.themeVector.size();
        for (i in 0...size) {
            var themeDomNodeInterface : DomNodeInterface = (cast this.themeVector.get(i) : DomNodeInterface);
            node.appendChild(themeDomNodeInterface.toXmlNode(document));
        }
        return node;
    }

}

