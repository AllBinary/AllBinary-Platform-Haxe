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
package org.allbinary.dom;

//import java.io.ByteArrayOutputStream;
//import java.io.File;
//import javax.xml.parsers.DocumentBuilder;
//import javax.xml.parsers.DocumentBuilderFactory;
//import javax.xml.transform.Transformer;
//import javax.xml.transform.TransformerFactory;
//import javax.xml.transform.dom.DOMSource;
//import javax.xml.transform.stream.StreamResult;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class DomHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : DomHelper = new DomHelper();
    public static function getInstance() : DomHelper {
        return DomHelper.instance;
    }

    public function new() {
    }

    public function createDocument() : Document {
        try {
            var factory : DocumentBuilderFactory = DocumentBuilderFactory.newInstance();
            var builder : DocumentBuilder = factory.newDocumentBuilder();
            var document : Document = builder.newDocument();
            return document;
        } catch (e : haxe.Exception) {
            return null;
        }
    }

    // throws Exception
    public function createDocument(xmlFile : File) : Document {
        try {
            var factory : DocumentBuilderFactory = DocumentBuilderFactory.newInstance();
            var builder : DocumentBuilder = factory.newDocumentBuilder();
            var document : Document = builder.parse(xmlFile);
            return document;
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function toString(document : Document) : String {
        try {
            var domSource : DOMSource = new DOMSource(document);
            var byteArrayOutputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            var streamResult : StreamResult = new StreamResult(byteArrayOutputStream);
            var copyTransformerFactory : TransformerFactory = TransformerFactory.newInstance();
            var copyTransformer : Transformer = copyTransformerFactory.newTransformer();
            copyTransformer.transform(domSource, streamResult);
            return byteArrayOutputStream.toString();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function save(file : File, document : Document) : Void {
        try {
            var copyTransformerFactory : TransformerFactory = TransformerFactory.newInstance();
            var copyTransformer : Transformer = copyTransformerFactory.newTransformer();
            var domSource : DOMSource = new DOMSource(document);
            file.createNewFile();
            var streamResult : StreamResult = new StreamResult(file);
            copyTransformer.transform(domSource, streamResult);
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function getChildNodeList(nodeName : String, nodeList : NodeList) : NodeList {
        var numberOfNodes : Int = nodeList.getLength();
        for (index in 0...numberOfNodes) {
            var node : Node = nodeList.item(index);
            if (node.getNodeName().compareTo(nodeName) == 0) {
                return node.getChildNodes();
            }
        }
        throw new haxe.Exception(nodeName + " Node Not Found");
    }

    // throws Exception
    public function getChildrenWithoutTextNodes(nodeName : String, nodeList : NodeList) : BasicArrayList {
        var list : BasicArrayList = new BasicArrayListD();
        var childNodeList : NodeList = this.getChildNodeList(nodeName, nodeList);
        var numberOfChildren : Int = childNodeList.getLength();
        for (index in 0...numberOfChildren) {
            var node : Node = childNodeList.item(index);
            if (node.getNodeType() != Node.TEXT_NODE) {
                list.add(node);
            }
        }
        return list;
    }

    // throws Exception
    public function getWithoutTextNodes(nodeList : NodeList) : BasicArrayList {
        var list : BasicArrayList = new BasicArrayListD();
        var numberOfChildren : Int = nodeList.getLength();
        for (index in 0...numberOfChildren) {
            var node : Node = nodeList.item(index);
            if (node.getNodeType() != Node.TEXT_NODE) {
                list.add(node);
            }
        }
        return list;
    }

    // throws Exception
    public function searchNodeList(nodeName : String, nodeList : NodeList) : Node {
        var numberOfNodes : Int = nodeList.getLength();
        for (index in 0...numberOfNodes) {
            var node : Node = nodeList.item(index);
            this.logUtil.putF("NodeName: " + node.getNodeName(), this, "searchNodeList");
            if (node.getNodeName().compareTo(nodeName) == 0) {
                return node;
            }
        }
        throw new haxe.Exception(nodeName + " Node Not Found in search");
    }

    // throws Exception
    public function searchNodeList(nodeName : String, nodeList : BasicArrayList) : Node {
        var numberOfNodes : Int = nodeList.size();
        for (index in 0...numberOfNodes) {
            var node : Node = (cast nodeList.get(index) : Node);
            this.logUtil.putF("NodeName: " + node.getNodeName(), this, "searchNodeList");
            if (node.getNodeName().compareTo(nodeName) == 0) {
                return node;
            }
        }
        throw new haxe.Exception(nodeName + " Node Not Found in search");
    }

}

