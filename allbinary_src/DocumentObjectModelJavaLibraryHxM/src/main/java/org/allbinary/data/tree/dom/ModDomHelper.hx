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
package org.allbinary.data.tree.dom;

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.java.anyType.clazz.ClassUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class ModDomHelper {
    public function new() {
    }

    // throws Exception
    public static function createTextNode(document : Document, name : String, text : String) : Node {
        var newValueNode : Node = document.createElement(name);
        var newValueTextNode : Node = document.createTextNode(text);
        newValueNode.appendChild(newValueTextNode);
        return newValueNode;
    }

    // throws Exception
    public static function createValueNode(document : Document, text : String) : Node {
        return ModDomHelper.createTextNode(document, DomData.VALUE, text);
    }

    // throws Exception
    public static function createNameNode(document : Document, text : String) : Node {
        return ModDomHelper.createTextNode(document, DomData.NAME, text);
    }

    // throws Exception
    public static function createIndexNode(document : Document, index : Int) : Node {
        return ModDomHelper.createTextNode(document, DomData.INDEX, index.toString());
    }

    // throws Exception
    public static function createNameValueNodes(document : Document, elementName : String, nameText : String, valueText : String) : Node {
        var newNode : Node = document.createElement(elementName);
        newNode.appendChild(ModDomHelper.createNameNode(document, nameText));
        newNode.appendChild(ModDomHelper.createValueNode(document, valueText));
        return newNode;
    }

    // throws Exception
    public static function createNameValueNodes(document : Document, elementNameAndNameText : String, valueText : String) : Node {
        var newNode : Node = ModDomHelper.createNameValueNodes(document, elementNameAndNameText, elementNameAndNameText, valueText);
        return newNode;
    }

    // throws Exception
    public static function createNameValueIndexNodes(document : Document, elementNameAndNameText : String, index : Int, valueText : String) : Node {
        var newNode : Node = ModDomHelper.createNameValueNodes(document, elementNameAndNameText, valueText);
        newNode.appendChild(ModDomHelper.createIndexNode(document, index));
        return newNode;
    }

    // throws Exception
    public static function createNameValueNodes(document : Document, rootNode : String, hashMap : HashMap) : Node {
        var node : Node = document.createElement(rootNode);
        return ModDomHelper.createNameValueNodes(document, node, hashMap);
    }

    // throws Exception
    public static function createNameValueNodes(document : Document, node : Node, hashMap : HashMap) : Node {
        var stringUtil : StringUtil = StringUtil.getInstance();
        var keySet : Set = hashMap.keySet();
        var keyArray : haxe.ds.Vector<Any> = keySet.toArray();
        var size : Int = keyArray.length;
        for (i in 0...size) {
            var objectKey : Any = keyArray[i];
            var name : String = (cast objectKey : String);
            var anyType : Any = (cast hashMap.get(objectKey) : Any);
            if (anyType == null) {
                var value : String = stringUtil.EMPTY_STRING;
                node.appendChild(ModDomHelper.createNameValueNodes(document, name, value));
            } else if (Std.isOfType(anyType, String)) {
                var value : String = stringUtil.getNonNull((cast anyType : String));
                node.appendChild(ModDomHelper.createNameValueNodes(document, name, value));
            } else if (Std.isOfType(anyType, HashMap)) {
                node.appendChild(ModDomHelper.createNameValueNodes(document, name, hashMap));
            } else {
                throw new haxe.Exception("HashMap value is the wrong instance and is: " + ClassUtil.viewAll(anyType, CommonSeps.getInstance().NEW_LINE));
            }
        }
        return node;
    }

    // throws Exception
    public static function createNameValueNodes(document : Document, rootNodeName : String, duplicateNodeName : String, valueVector : BasicArrayList) : Node {
        var stringUtil : StringUtil = StringUtil.getInstance();
        var node : Node = document.createElement(rootNodeName);
        var size : Int = valueVector.size();
        for (i in 0...size) {
            var value : String = stringUtil.getNonNull((cast valueVector.get(i) : String));
            node.appendChild(ModDomHelper.createNameValueNodes(document, duplicateNodeName, value));
        }
        return node;
    }

    // throws Exception
    public static function createNameValueIndexNodes(document : Document, rootNodeName : String, duplicateNodeName : String, valueVector : BasicArrayList) : Node {
        var stringUtil : StringUtil = StringUtil.getInstance();
        var node : Node = document.createElement(rootNodeName);
        var size : Int = valueVector.size();
        for (index in 0...size) {
            var value : String = stringUtil.getNonNull((cast valueVector.get(index) : String));
            node.appendChild(ModDomHelper.createNameValueIndexNodes(document, duplicateNodeName, index, value));
        }
        return node;
    }

    // throws Exception
    public static function createNodeWithValueNodes(document : Document, rootNode : String, hashMap : HashMap) : Node {
        var node : Node = document.createElement(rootNode);
        return ModDomHelper.createNodeWithValueNodes(document, node, hashMap);
    }

    // throws Exception
    public static function createNodeWithValueNodes(document : Document, node : Node, hashMap : HashMap) : Node {
        var stringUtil : StringUtil = StringUtil.getInstance();
        var keySet : Set = hashMap.keySet();
        var keyArray : haxe.ds.Vector<Any> = keySet.toArray();
        var size : Int = keyArray.length;
        for (i in 0...size) {
            var name : String = (cast keyArray[i] : String);
            var anyType : Any = (cast hashMap.get(name) : Any);
            var value : String = stringUtil.getNonNull((cast anyType : String));
            node.appendChild(ModDomHelper.createTextNode(document, name, value));
        }
        return node;
    }

}

