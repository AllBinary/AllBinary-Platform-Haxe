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
package org.allbinary.logic.visual.transform.info;

import org.allbinary.data.tree.dom.DomNodeInterface;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;

class TransformInfoDomNodeView extends TransformInfoDomNode implements DomNodeInterface {
    public function new(transformInfoInterface : TransformInfoInterface, mapping : String) {
        super(transformInfoInterface, mapping);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(name : String, mappedName : String) {
        super(name, mappedName);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(name : String) {
        super(name, null);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var transformInfoData : TransformInfoData = TransformInfoData.getInstance();
        var subViewNode : Node = document.createElement(transformInfoData.NAME);
        var viewNameAttr : Attr = document.createAttribute(transformInfoData.NAME);
        viewNameAttr.setValue(this.getTransformInfoInterface().getName());
        var componentNodeAttributes : NamedNodeMap = subViewNode.getAttributes();
        componentNodeAttributes.setNamedItem(viewNameAttr);
        if (this.getMappedName() != null) {
            var mappedNameAttr : Attr = document.createAttribute(transformInfoData.MAPPED);
            mappedNameAttr.setValue(this.getMappedName());
            componentNodeAttributes.setNamedItem(mappedNameAttr);
        }
        return subViewNode;
    }

}

