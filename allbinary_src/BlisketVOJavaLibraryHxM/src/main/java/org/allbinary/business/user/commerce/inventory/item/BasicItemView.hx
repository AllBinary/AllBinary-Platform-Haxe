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
package org.allbinary.business.user.commerce.inventory.item;

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasicItemView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private final itemInterface : ItemInterface;
    private final vector : BasicArrayList;
    public function new(itemInterface : ItemInterface, vector : BasicArrayList) {
        this.itemInterface = itemInterface;
        this.vector = vector;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING)) {
            this.logUtil.putF(this.commonStrings.START, this, "toXmlNode");
        }
        var hashMap : HashMap = this.itemInterface.toHashMap();
        final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
        hashMap.put(this.basicItemData.IMAGE, EMPTY_STRING);
        var stringUtil : StringUtil = StringUtil.getInstance();
        var keySet : Set = hashMap.keySet();
        var node : Node = document.createElement(this.basicItemData.ITEM);
        final nameArray : haxe.ds.Vector<Any> = keySet.toArray();
        final size2 : Int = nameArray.length;
        for (index in 0...size2) {
            var name : String = (cast nameArray[index] : String);
            var value : String = (cast hashMap.get(name) : String);
            value = stringUtil.getNonNull(value);
            node.appendChild(ModDomHelper.createNameValueNodes(document, name, value));
        }
        var totalNode : Node = ModDomHelper.createNameValueNodes(document, this.basicItemData.TOTAL, Std.string(this.itemInterface.getTotal()));
        node.appendChild(totalNode);
        final size : Int = this.vector.size();
        for (index in 0...size) {
            var domNodeInterface : DomNodeInterface = (cast this.vector.get(index) : DomNodeInterface);
            var customNode : Node = domNodeInterface.toXmlNode(document);
            node.appendChild(customNode);
        }
        return node;
    }

    public function toXmlDoc() : Document {
        return null;
    }

    public function view() : String {
        return null;
    }

}

