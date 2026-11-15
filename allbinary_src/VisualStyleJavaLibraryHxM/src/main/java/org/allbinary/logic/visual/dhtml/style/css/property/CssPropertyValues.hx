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
import org.allbinary.string.CommonSeps;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class CssPropertyValues implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var propertyValueVector : BasicArrayList;
    public function new() {
        this.propertyValueVector = new BasicArrayListD();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        var indexPropertyValueHashMap : HashMap = StdUtil.getInstance().createHashMap();
        this.propertyValueVector = new BasicArrayListD();
        var cssPropertyNodeVector : BasicArrayList = DomSearchHelper.getAllNodes(CssPropertyValueData.getInstance().NAME, node.getChildNodes());
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().STYLE)) {
            this.logUtil.putF("Number Of Properties: " + cssPropertyNodeVector.size(), this, "CssProperties()");
        }
        final size : Int = cssPropertyNodeVector.size();
        for (index in 0...size) {
            var cssPropertyValueNode : Node = (cast cssPropertyNodeVector.get(index) : Node);
            var valueNode : Node = DomSearchHelper.getNode(DomData.VALUE, cssPropertyValueNode.getChildNodes());
            var propertyValue : String = DomNodeHelper.getTextNodeValue(valueNode);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().STYLE)) {
                this.logUtil.putF("Property Value: " + propertyValue, this, "CssProperties()");
            }
            var indexNode : Node = DomSearchHelper.getNode(DomData.INDEX, cssPropertyValueNode.getChildNodes());
            var indexValue : String = DomNodeHelper.getTextNodeValue(indexNode);
            indexPropertyValueHashMap.put(indexValue, propertyValue);
        }
        final size2 : Int = indexPropertyValueHashMap.keySet().size();
        for (index in 0...size2) {
            var indexInt : Null<Int> = index;
            var propertyValue : String = (cast indexPropertyValueHashMap.get(Std.string(indexInt)) : String);
            this.propertyValueVector.add(propertyValue);
        }
    }

    public function toHashMap() : HashMap {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final cssPropertyValueData : CssPropertyValueData = CssPropertyValueData.getInstance();
        final hashMap : HashMap = StdUtil.getInstance().createHashMap();
        final stringBuffer : StringMaker = new StringMaker();
        final size : Int = this.propertyValueVector.size();
        {
            var index : Int = 0;
            while (index < size) {
            var value : String = (cast this.propertyValueVector.get(index) : String);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(cssPropertyValueData.NAME);
            stringBuffer.append(commonSeps.BRACKET_OPEN);
            stringBuffer.appendint(index);
            stringBuffer.append(commonSeps.BRACKET_CLOSE);
            hashMap.put(Std.string(stringBuffer), value);
            index++;
                index++;
            }
        }
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var hashMap : HashMap = this.toHashMap();
            this.logUtil.putF("CssPropertyValues HashMap: " + Std.string(hashMap), this, "toXmlNode()");
        }
        return ModDomHelper.createNameValueIndexNodes(document, CssPropertyData.getInstance().VALUES, CssPropertyValueData.getInstance().NAME, this.propertyValueVector);
    }

}

