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

import jre.util.HashMap;
import jre.util.Set;
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
        return ModDomHelper.createTextNode(document, DomData.INDEX, Std.string(index));
    }

    public static function createNameValueNodes(...args : Dynamic) : Dynamic {
        if (args.length == 4 && Std.isOfType(args[0], Document) && Std.isOfType(args[0], String) && Std.isOfType(args[0], String) && Std.isOfType(args[0], String)) {
            return ModDomHelper.createNameValueNodes_Document_String_String_String(args[0], args[1], args[2], args[3]);
        }
        if (args.length == 3 && Std.isOfType(args[0], Document) && Std.isOfType(args[0], String) && Std.isOfType(args[0], String)) {
            return ModDomHelper.createNameValueNodes_Document_String_String(args[0], args[1], args[2]);
        }
        if (args.length == 3 && Std.isOfType(args[0], Document) && Std.isOfType(args[0], String) && Std.isOfType(args[0], HashMap)) {
            return ModDomHelper.createNameValueNodes_Document_String_HashMap(args[0], args[1], args[2]);
        }
        if (args.length == 3) {
            return ModDomHelper.createNameValueNodes_Document_Node_HashMap(args[0], args[1], args[2]);
        }
        if (args.length == 4) {
            return ModDomHelper.createNameValueNodes_Document_String_String_BasicArrayList(args[0], args[1], args[2], args[3]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: createNameValueNodes");
    }

    // throws Exception
    public static function createNameValueNodes_Document_String_String_String(document : Document, elementName : String, nameText : String, valueText : String) : Node {
        var newNode : Node = document.createElement(elementName);
        newNode.appendChild(ModDomHelper.createNameNode(document, nameText));
        newNode.appendChild(ModDomHelper.createValueNode(document, valueText));
        return newNode;
    }

    // throws Exception
    public static function createNameValueNodes_Document_String_String(document : Document, elementNameAndNameText : String, valueText : String) : Node {
        var newNode : Node = ModDomHelper.createNameValueNodes(document, elementNameAndNameText, elementNameAndNameText, valueText);
        return newNode;
    }

    public static function createNameValueIndexNodes(...args : Dynamic) : Dynamic {
        if (args.length == 4 && Std.isOfType(args[0], Document) && Std.isOfType(args[0], String) && Std.isOfType(args[0], Int) && Std.isOfType(args[0], String)) {
            return ModDomHelper.createNameValueIndexNodes_Document_String_int_String(args[0], args[1], args[2], args[3]);
        }
        if (args.length == 4) {
            return ModDomHelper.createNameValueIndexNodes_Document_String_String_BasicArrayList(args[0], args[1], args[2], args[3]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: createNameValueIndexNodes");
    }

    // throws Exception
    public static function createNameValueIndexNodes_Document_String_int_String(document : Document, elementNameAndNameText : String, index : Int, valueText : String) : Node {
        var newNode : Node = ModDomHelper.createNameValueNodes(document, elementNameAndNameText, valueText);
        newNode.appendChild(ModDomHelper.createIndexNode(document, index));
        return newNode;
    }

    // throws Exception
    public static function createNameValueNodes_Document_String_HashMap(document : Document, rootNode : String, hashMap : HashMap<Dynamic, Dynamic>) : Node {
        var node : Node = document.createElement(rootNode);
        return ModDomHelper.createNameValueNodes(document, node, hashMap);
    }

    // throws Exception
    public static function createNameValueNodes_Document_Node_HashMap(document : Document, node : Node, hashMap : HashMap<Dynamic, Dynamic>) : Node {
        var stringUtil : StringUtil = StringUtil.getInstance();
        var keySet : Set<Dynamic> = hashMap.keySet();
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
                throw new jre.lang.JavaException("HashMap value is the wrong instance and is: " + ClassUtil.viewAll(anyType, CommonSeps.getInstance().NEW_LINE));
            }
        }
        return node;
    }

    // throws Exception
    public static function createNameValueNodes_Document_String_String_BasicArrayList(document : Document, rootNodeName : String, duplicateNodeName : String, valueVector : BasicArrayList) : Node {
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
    public static function createNameValueIndexNodes_Document_String_String_BasicArrayList(document : Document, rootNodeName : String, duplicateNodeName : String, valueVector : BasicArrayList) : Node {
        var stringUtil : StringUtil = StringUtil.getInstance();
        var node : Node = document.createElement(rootNodeName);
        var size : Int = valueVector.size();
        for (index in 0...size) {
            var value : String = stringUtil.getNonNull((cast valueVector.get(index) : String));
            node.appendChild(ModDomHelper.createNameValueIndexNodes(document, duplicateNodeName, index, value));
        }
        return node;
    }

    public static function createNodeWithValueNodes(...args : Dynamic) : Dynamic {
        if (args.length == 3 && Std.isOfType(args[0], Document) && Std.isOfType(args[0], String) && Std.isOfType(args[0], HashMap)) {
            return ModDomHelper.createNodeWithValueNodes_Document_String_HashMap(args[0], args[1], args[2]);
        }
        if (args.length == 3) {
            return ModDomHelper.createNodeWithValueNodes_Document_Node_HashMap(args[0], args[1], args[2]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: createNodeWithValueNodes");
    }

    // throws Exception
    public static function createNodeWithValueNodes_Document_String_HashMap(document : Document, rootNode : String, hashMap : HashMap<Dynamic, Dynamic>) : Node {
        var node : Node = document.createElement(rootNode);
        return ModDomHelper.createNodeWithValueNodes(document, node, hashMap);
    }

    // throws Exception
    public static function createNodeWithValueNodes_Document_Node_HashMap(document : Document, node : Node, hashMap : HashMap<Dynamic, Dynamic>) : Node {
        var stringUtil : StringUtil = StringUtil.getInstance();
        var keySet : Set<Dynamic> = hashMap.keySet();
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

