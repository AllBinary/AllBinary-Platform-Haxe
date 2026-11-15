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
package org.allbinary.business.user.commerce.inventory.basket;

//import java.util.HashSet;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.commerce.inventory.item.Item;
import org.allbinary.business.user.commerce.inventory.item.ItemView;
import org.allbinary.logic.StdUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasketReview {
    public var items : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function isValid() : Null<Bool> {
        return true;
    }

    public function addItem(item : Item) : Void {
        this.items.add(item);
    }

    public function getItems() : BasicArrayList {
        return this.items;
    }

    public function removeItem(id : String) : Void {
        final itemArray : haxe.ds.Vector<Any> = this.items.toArray();
        final size : Int = itemArray.length;
        for (index in 0...size) {
            var item : Item = (cast itemArray[index] : Item);
            if (item.getId().compareTo(id) == 0) {
                this.items.remove(item);
            }
        }
    }

    public function adjustItem(id : String, num : String) : Void {
        final itemArray : haxe.ds.Vector<Any> = this.items.toArray();
        final size : Int = itemArray.length;
        for (index in 0...size) {
            var item : Item = (cast itemArray[index] : Item);
            if (item.getId().compareTo(id) == 0) {
                item.setNumber(num);
            }
        }
    }

    public function getTotalWeight() : String {
        var weightFloat : Float = 0.0;
        final itemArray : haxe.ds.Vector<Any> = this.items.toArray();
        final size : Int = itemArray.length;
        for (index in 0...size) {
            var item : Item = (cast itemArray[index] : Item);
            weightFloat += item.getWeight();
        }
        return weightFloat.toString();
    }

    public function getNumberOfItems() : Null<Int> {
        return this.items.size();
    }

    public function getIds() : Set {
        var idSet : HashSet = new HashSet();
        final itemArray : haxe.ds.Vector<Any> = this.items.toArray();
        final size : Int = itemArray.length;
        for (index in 0...size) {
            var item : Item = (cast itemArray[index] : Item);
            idSet.add(item.getId());
        }
        return (cast idSet : Set);
    }

    public function getNumberOf(id : String) : Null<Int> {
        final itemArray : haxe.ds.Vector<Any> = this.items.toArray();
        final size : Int = itemArray.length;
        for (index in 0...size) {
            var item : Item = (cast itemArray[index] : Item);
            if (item.getId().compareTo(id) == 0) {
                return item.getNumber();
            }
        }
        return 0;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(BasketData.BASKET);
        final itemArray : haxe.ds.Vector<Any> = this.items.toArray();
        final size : Int = itemArray.length;
        for (index in 0...size) {
            var item : Item = (cast itemArray[index] : Item);
            node.appendChild(new ItemView(item, new BasicArrayListD()).toXmlNode(document));
        }
        return node;
    }

}

