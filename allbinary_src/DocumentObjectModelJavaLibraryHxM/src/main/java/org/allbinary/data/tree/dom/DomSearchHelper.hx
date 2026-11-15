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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class DomSearchHelper {
    public function new() {
    }

    public static function getNodeNoThrow(nodeName : String, nodeList : NodeList) : Node {
        final numberOfNodes : Int = nodeList.getLength();
        for (index in 0...numberOfNodes) {
            final node : Node = nodeList.item(index);
            if (node.getNodeName().compareTo(nodeName) == 0) {
                return node;
            }
        }
        return null;
    }

    // throws Exception
    public static function getNode(nodeName : String, nodeList : NodeList) : Node {
        var node : Node = DomSearchHelper.getNodeNoThrow(nodeName, nodeList);
        if (node != null) {
            return node;
        } else {
            throw new jre.lang.JavaException(nodeName + " Node Not Found in search");
        }
    }

    // throws Exception
    public static function getChildNodeList(nodeName : String, nodeList : NodeList) : NodeList {
        var node : Node = DomSearchHelper.getNode(nodeName, nodeList);
        return node.getChildNodes();
    }

    // throws Exception
    public static function getAllNodes(nodeName : String, nodeList : NodeList) : BasicArrayList {
        var vector : BasicArrayList = DomSearchHelper.getAllNodesNoThrow(nodeName, nodeList);
        if (vector == null) {
            throw new jre.lang.JavaException(nodeName + " Node Not Found in search");
        } else {
            return vector;
        }
    }

    public static function getAllNodesNoThrow(nodeName : String, nodeList : NodeList) : BasicArrayList {
        var nodeVector : BasicArrayList = new BasicArrayListD();
        var numberOfNodes : Int = nodeList.getLength();
        for (index in 0...numberOfNodes) {
            var node : Node = nodeList.item(index);
            if (node.getNodeName().compareTo(nodeName) == 0) {
                nodeVector.add(node);
            }
        }
        return nodeVector;
    }

}

