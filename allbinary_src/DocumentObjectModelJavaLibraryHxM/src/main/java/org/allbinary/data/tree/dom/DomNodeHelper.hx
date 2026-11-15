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

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class DomNodeHelper {
    public function new() {
    }

    public static function getFirstChildElement(parentNode : Node) : Node {
        var node : Node = parentNode.getFirstChild();
        if (node != null && node.getNodeType() != Node.ELEMENT_NODE) {
            var nodeList : NodeList = parentNode.getChildNodes();
            for (index in 0...nodeList.getLength()) {
                node = nodeList.item(index);
                if (node.getNodeType() == 1) {
                    break;
                }
            }
        }
        return node;
    }

    public static function getTextNodeValue(node : Node) : String {
        var nodeTextNode : Node = node.getFirstChild();
        if (nodeTextNode != null) {
            return nodeTextNode.getNodeValue();
        } else {
            return StringUtil.getInstance().EMPTY_STRING;
        }
    }

    // throws Exception
    public static function getTextNodeValue(nodeName : String, nodeList : NodeList) : String {
        var node : Node = DomSearchHelper.getNode(nodeName, nodeList);
        return DomNodeHelper.getTextNodeValue(node);
    }

    public static function getTextNodesValue(node : Node) : String {
        var stringBuffer : StringMaker = new StringMaker();
        var nodeList : NodeList = node.getChildNodes();
        for (index in 0...nodeList.getLength()) {
            var nodeTextNode : Node = nodeList.item(index);
            if (nodeTextNode.getNodeType() == Node.TEXT_NODE) {
                if (nodeTextNode != null) {
                    stringBuffer.append(nodeTextNode.getNodeValue());
                }
            }
        }
        return stringBuffer.toString();
    }

}

