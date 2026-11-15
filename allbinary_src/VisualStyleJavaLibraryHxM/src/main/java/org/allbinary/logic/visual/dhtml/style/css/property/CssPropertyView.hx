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
package org.allbinary.logic.visual.dhtml.style.css.property;

import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class CssPropertyView implements DomNodeInterface {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var cssProperty : CssProperty;
    public function new(name : String) {
        this.cssProperty = new CssProperty(name);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        this.cssProperty = new CssProperty(node);
    }

    public function getProperty() : CssProperty {
        return this.cssProperty;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        return this.cssProperty.toXmlNode(document);
    }

}

