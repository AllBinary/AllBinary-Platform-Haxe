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
package org.allbinary.logic.visual.dhtml.style.css;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.dhtml.style.css.property.CssPropertiesValidationFactory;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class CssElementView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final TITLE : String = "title";
    private final DESCRIPTION : String = "description";
    private var value : String;
    private var title : String;
    private var description : String;
    public var cssElementVector : BasicArrayList = null;
    public var cssPropertyVector : BasicArrayList;
    public function new() {
        this.cssPropertyVector = new BasicArrayListD();
        final stringUtil : StringUtil = StringUtil.getInstance();
        this.title = stringUtil.EMPTY_STRING;
        this.description = stringUtil.EMPTY_STRING;
        this.value = stringUtil.EMPTY_STRING;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        try {
            final valueNode : Node = DomSearchHelper.getNode(DomData.VALUE, node.getChildNodes());
            this.value = DomNodeHelper.getTextNodeValue(valueNode);
            final titleValueNode : Node = DomSearchHelper.getNodeNoThrow(this.TITLE, node.getChildNodes());
            if (titleValueNode != null) {
                this.title = DomNodeHelper.getTextNodeValue(titleValueNode);
            } else {
                final stringUtil : StringUtil = StringUtil.getInstance();
                this.title = stringUtil.EMPTY_STRING;
            }
            final descriptionValueNode : Node = DomSearchHelper.getNodeNoThrow(this.DESCRIPTION, node.getChildNodes());
            if (descriptionValueNode != null) {
                this.description = DomNodeHelper.getTextNodeValue(descriptionValueNode);
            } else {
                this.description = StringUtil.getInstance().EMPTY_STRING;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF(new StringMaker().append("Value: ").append(this.value).append("\nTitle: ").append(this.title).append("\nDescription: ").append(this.description).toString(), this, this.commonStrings.CONSTRUCTOR);
            }
            var cssElementStyleNodeVector : BasicArrayList = DomSearchHelper.getAllNodes(CssElementData.getInstance().NAME, node.getChildNodes());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Child Css Elements: " + cssElementStyleNodeVector.size(), this, "CssElementView()");
            }
            this.cssElementVector = CssElementsValidationFactory.getInstance(cssElementStyleNodeVector);
            final nodeList : NodeList = node.getChildNodes();
            this.cssPropertyVector = CssPropertiesValidationFactory.getInstance(nodeList);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(new StringMaker().append("Value: ").append(this.value).append("\nTitle: ").append(this.title).append("\nDescription: ").append(this.description).toString(), this, this.commonStrings.CONSTRUCTOR, e);
            }
            throw new haxe.Exception("CssElementView");
        }
    }

    public function getValue() : String {
        return this.value;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(DomData.VALUE, this.value);
        hashMap.put(this.TITLE, this.title);
        hashMap.put(this.DESCRIPTION, this.description);
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.toHashMap();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("CssView HashMap: " + hashMap.toString(), this, "toXmlNode");
        }
        var node : Node = ModDomHelper.createNodeWithValueNodes(document, CssElementData.getInstance().NAME, hashMap);
        final size : Int = this.cssPropertyVector.size();
        for (index in 0...size) {
            var cssPropertyDomNodeInterface : DomNodeInterface = (cast this.cssPropertyVector.get(index) : DomNodeInterface);
            node.appendChild(cssPropertyDomNodeInterface.toXmlNode(document));
        }
        final size2 : Int = this.cssElementVector.size();
        for (index in 0...size2) {
            var cssElementDomNodeInterface : DomNodeInterface = (cast this.cssElementVector.get(index) : DomNodeInterface);
            node.appendChild(cssElementDomNodeInterface.toXmlNode(document));
        }
        return node;
    }

}

