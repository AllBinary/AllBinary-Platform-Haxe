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
import org.allbinary.business.user.address.StreetAddressData;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.string.StringUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class ItemView {
    private final itemInterface : OrderItemInterface;
    private final vector : BasicArrayList;
    public function new(itemInterface : OrderItemInterface, vector : BasicArrayList) {
        this.itemInterface = itemInterface;
        this.vector = vector;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.itemInterface.toHashMap();
        var keySet : Set = hashMap.keySet();
        var node : Node = document.createElement(ItemData.ITEM);
        var basicItemView : BasicItemView = new BasicItemView(this.itemInterface, this.vector);
        node.appendChild(basicItemView.toXmlNode(document));
        final stringUtil : StringUtil = StringUtil.getInstance();
        final nameArray : haxe.ds.Vector<Any> = keySet.toArray();
        final size : Int = nameArray.length;
        for (index in 0...size) {
            var name : String = (cast nameArray[index] : String);
            var value : String = (cast hashMap.get(name) : String);
            value = stringUtil.getNonNull(value);
            node.appendChild(ModDomHelper.createNameValueNodes(document, name, value));
        }
        var shippingAddressNode : Node = document.createElement(StreetAddressData.NAME);
        shippingAddressNode.appendChild(this.itemInterface.getShippingAddress().toXmlNode(document));
        return node;
    }

}

