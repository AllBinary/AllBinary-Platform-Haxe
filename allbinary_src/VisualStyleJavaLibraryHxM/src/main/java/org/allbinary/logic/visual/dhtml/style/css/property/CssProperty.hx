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

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class CssProperty implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var propertyName : String;
    private var cssPropertyValues : CssPropertyValues;
    public function new(name : String) {
        this.propertyName = name;
        this.cssPropertyValues = new CssPropertyValues();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        var propertyNode : Node = DomSearchHelper.getNode(DomData.VALUE, node.getChildNodes());
        this.propertyName = DomNodeHelper.getTextNodeValue(propertyNode);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().STYLE)) {
            this.logUtil.putF("Name: " + this.getName(), this, "CssProperty()");
        }
        var propertyValuesNode : Node = DomSearchHelper.getNode(CssPropertyData.getInstance().VALUES, node.getChildNodes());
        this.cssPropertyValues = new CssPropertyValues(propertyValuesNode);
    }

    public function getName() : String {
        return this.propertyName;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(CssPropertyData.getInstance().NAME, this.propertyName);
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.toHashMap();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("CssView HashMap: " + Std.string(hashMap), this, "toXmlNode()");
        }
        var node : Node = ModDomHelper.createNameValueNodes(document, CssPropertyData.getInstance().NAME, this.propertyName);
        node.appendChild(this.cssPropertyValues.toXmlNode(document));
        return node;
    }

}

