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
package org.allbinary.logic.communication.http.request;

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.data.tree.dom.DomData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

//containing string values and other hashmaps of the like
class NameSpaceRequestParams extends RequestParams {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("Constructing empty", this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(httpServletRequest : HttpServletRequest) {
        super(httpServletRequest);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("Constructing from HttpServletRequest", this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(pageContext : PageContext) {
        super(pageContext);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("Constructing from PageContext", this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // throws Exception
    private function createPackageNode(document : Document, packageName : String, packagePropertiesHashMap : HashMap) : Node {
        final node : Node = document.createElement(packageName);
        final propertyKeySet : Set = packagePropertiesHashMap.keySet();
        final propertyKeySetArray : haxe.ds.Vector<Any> = propertyKeySet.toArray();
        final size : Int = propertyKeySetArray.length;
        for (index in 0...size) {
            var propertyName : String = (cast propertyKeySetArray[index] : String);
            var propertyValue : String = (cast packagePropertiesHashMap.get(propertyName) : String);
            var propertyNode : Node = ModDomHelper.createTextNode(document, propertyName, propertyValue);
            node.appendChild(propertyNode);
        }
        return node;
    }

    // throws Exception
    private function createPackageMultiNode(document : Document, nameSpaceRequestParam : NameSpaceRequestParam, packageName : String, packagePropertiesHashMap : HashMap) : Node {
        var beginIndex : Int = packageName.indexOf("[".code);
        var indexValue : String = packageName.substring(beginIndex + 1, packageName.length - 1);
        var multiElementPackage : String = packageName.substring(0, beginIndex);
        var selectedValue : String = nameSpaceRequestParam.getValue();
        var propertyValue : String = (cast packagePropertiesHashMap.get(DomData.VALUE) : String);
        if (Reflect.compare(propertyValue, NameSpaceRequestParamData.VALUE) != 0) {
            selectedValue = propertyValue;
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("\nAppending Multinode Element: " + multiElementPackage + "[" + indexValue + "] " + selectedValue, this, "createPackageMultiNode");
        }
        var nextNode : Node = ModDomHelper.createNameValueNodes(document, multiElementPackage, selectedValue);
        var indexNode : Node = ModDomHelper.createTextNode(document, DomData.INDEX, indexValue);
        nextNode.appendChild(indexNode);
        return nextNode;
    }

    // throws Exception
    private function getRootNode(rootElementPackage : String, packagePropertiesHashMap : HashMap, document : Document) : Node {
        var rootNode : Node = DomSearchHelper.getNodeNoThrow(rootElementPackage, document.getChildNodes());
        if (rootNode == null) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                this.logUtil.putF("\nAppending Document Root: " + "\nElementName: " + rootElementPackage + "\nProperties: " + Std.string(packagePropertiesHashMap), this, "getRootNode");
            }
            var node : Node = this.createPackageNode(document, rootElementPackage, packagePropertiesHashMap);
            document.appendChild(node);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                this.logUtil.putF("\nAppended Document Created: " + XmlDocumentHelper.toString(document), this, "getRootNode");
            }
            return node;
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                this.logUtil.putF("\nUsing Existing Root Node", this, "getRootNode");
            }
            return rootNode;
        }
    }

    // throws Exception
    private function addNewProperties(document : Document, node : Node, nextPackagePropertiesHashMap : HashMap) : Node {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF(Std.string(new StringMaker().append("\nAdding Any New Properties: ").append(Std.string(nextPackagePropertiesHashMap)).append("\nto node: ").append(node.getNodeName())), this, "addNewProperties");
        }
        final propertyNameSet : Set = nextPackagePropertiesHashMap.keySet();
        final propertyNameSetArray : haxe.ds.Vector<Any> = propertyNameSet.toArray();
        final size : Int = propertyNameSetArray.length;
        for (index in 0...size) {
            var nextPropertyName : String = (cast propertyNameSetArray[index] : String);
            var propertyValue : String = StringUtil.getInstance().getNonNull((cast nextPackagePropertiesHashMap.get(nextPropertyName) : String));
            var valueNode : Node = DomSearchHelper.getNodeNoThrow(nextPropertyName, node.getChildNodes());
            if (valueNode != null) {
                var existingElementNodeTextNodeValue : String = DomNodeHelper.getTextNodeValue(valueNode);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("\nIf property: \"" + nextPropertyName + " is the same as:\n" + "Node: " + node.getNodeName() + " then: " + propertyValue + "==" + existingElementNodeTextNodeValue, this, "addNewProperties");
                }
                if (Reflect.compare(propertyValue, existingElementNodeTextNodeValue) != 0) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                        this.logUtil.putF("At least one Property from NameSpaceRequest Package was different from Node", this, "addNewProperties");
                    }
                    throw new haxe.Exception("Property Modifications Should Not Occur");
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("Adding a new Property: " + nextPropertyName + "=" + propertyValue, this, "addNewProperties");
                }
                var newPropertyNode : Node = ModDomHelper.createTextNode(document, nextPropertyName, propertyValue);
                node.appendChild(newPropertyNode);
            }
        }
        return node;
    }

    // throws Exception
    private function isElementValueTextNodeEqual(nextPackagePropertiesHashMap : HashMap, node : Node) : Bool {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("\nComparing the value property in: " + Std.string(nextPackagePropertiesHashMap) + "\nto node child leaves of node: " + node.getNodeName(), this, "isElementValueTextNodeEqual");
        }
        var propertyValue : String = (cast nextPackagePropertiesHashMap.get(DomData.VALUE) : String);
        var valueNode : Node = DomSearchHelper.getNodeNoThrow(DomData.VALUE, node.getChildNodes());
        if (valueNode != null) {
            var existingElementNodeTextNodeValue : String = DomNodeHelper.getTextNodeValue(valueNode);
            if (Reflect.compare(propertyValue, existingElementNodeTextNodeValue) == 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("Value Node is the same", this, "isElementValueTextNodeEqual");
                }
                return true;
            }
        } else {
            return true;
        }
        return false;
    }

    // throws Exception
    private function isElementValueTextNodeUnique(nextPackagePropertiesHashMap : HashMap, elementNodeVector : BasicArrayList) : Int {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("\nComparing Properties of: " + elementNodeVector.size() + " Nodes", this, "isElementValueTextNodeUnique");
        }
        final size : Int = elementNodeVector.size();
        for (index in 0...size) {
            var existingElementNode : Node = (cast elementNodeVector.get(index) : Node);
            if (this.isElementValueTextNodeEqual(nextPackagePropertiesHashMap, existingElementNode)) {
                return index;
            }
        }
        return -1;
    }

    // throws Exception
    private function addChildren(document : Document, rootNode : Node, nameSpaceRequestParam : NameSpaceRequestParam) : Document {
        var node : Node = rootNode;
        final packageVector : BasicArrayList = nameSpaceRequestParam.getPackages();
        final size : Int = packageVector.size();
        for (index in 1...size) {
            var nextPackageName : String = (cast packageVector.get(index) : String);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                this.logUtil.putF(Std.string(new StringMaker().append("\nTrying to Add Child to Node: ").append(node.getNodeName()).append("\nwith new PackageName: ").append(nextPackageName)), this, "addChildren");
            }
            var nextPackagePropertiesHashMap : HashMap = nameSpaceRequestParam.getPackageProperties(index);
            var elementNodeVector : BasicArrayList = DomSearchHelper.getAllNodesNoThrow(nextPackageName, node.getChildNodes());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                this.logUtil.putF("\nDocument Contains " + elementNodeVector.size() + " Node(s) With Same Name", this, "addChildren");
            }
            var isElementValueTextNodeUniqueIndex : Int = this.isElementValueTextNodeUnique(nextPackagePropertiesHashMap, elementNodeVector);
            if ((elementNodeVector.size() == 0 || isElementValueTextNodeUniqueIndex == -1) && !StringTools.endsWith(nextPackageName, CommonSeps.getInstance().BRACKET_CLOSE)) {
                var nextNode : Node = this.createPackageNode(document, nextPackageName, nextPackagePropertiesHashMap);
                node.appendChild(nextNode);
                node = nextNode;
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("\nAppended Package: " + node.getNodeName(), this, "addChildren");
                    this.logUtil.putF("\nAppended Document Created: " + XmlDocumentHelper.toString(document), this, "addChildren");
                }
            } else if (StringTools.endsWith(nextPackageName, CommonSeps.getInstance().BRACKET_CLOSE)) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("Package is MultiNode: just append", this, "addChildren");
                }
                var nextNode : Node = this.createPackageMultiNode(document, nameSpaceRequestParam, nextPackageName, nextPackagePropertiesHashMap);
                node.appendChild(nextNode);
                node = nextNode;
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("\nAppended Multinode Element: " + XmlDocumentHelper.toString(document), this, "addChildren");
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("Value Node already exists: Now compare (properties to leaf nodes)", this, "addChildren");
                }
                var nodeNameDuplicateNode : Node = (cast elementNodeVector.get(isElementValueTextNodeUniqueIndex) : Node);
                node = this.addNewProperties(document, nodeNameDuplicateNode, nextPackagePropertiesHashMap);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("\nDuplicate Node Found: Moving to next child ^", this, "addChildre");
                }
            }
        }
        return document;
    }

    // throws Exception
    private function addNameSpace(key : String, value : String, document : Document) : Document {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF(Std.string(new StringMaker().append("NameSpace key: ").append(key).append(" Value: ").append(value)), this, "addNameSpace");
        }
        final nameSpaceRequestParam : NameSpaceRequestParam = new NameSpaceRequestParam(key, value);
        final packageVector : BasicArrayList = nameSpaceRequestParam.getPackages();
        final size : Int = packageVector.size();
        for (index in 0...size) {
            var packageName : String = (cast packageVector.get(index) : String);
            var packagePropertiesHashMap : HashMap = nameSpaceRequestParam.getPackageProperties(packageVector.indexOf(packageName));
            var rootNode : Node = this.getRootNode(packageName, packagePropertiesHashMap, document);
            if (index < size - 1) {
                return this.addChildren(document, (cast rootNode : Node), nameSpaceRequestParam);
            }
        }
        return document;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        var document : Document = DomDocumentHelper.create();
        final hashMap : HashMap = StdUtil.getInstance().createHashMap();
        final keys : Set = this.getMap().keySet();
        final keyArray : haxe.ds.Vector<Any> = keys.toArray();
        final keySize : Int = keyArray.length;
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("NameSpace Request Size: " + keys.size(), this, "toHashMap");
        }
        for (i in 0...keySize) {
            var key : String = (cast keyArray[i] : String);
            var anyType : Any = this.getMap().get(key);
            var className : String = (cast Type.getClassName(Type.getClass(anyType)) : String);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                this.logUtil.putF("Request Param Class: " + className, this, "toHashMap");
            }
            if (Std.isOfType(this.getMap().get(key), String)) {
                var value : String = (cast this.getMap().get(key) : String);
                if (key.indexOf(NameSpaceRequestParamData.NAME) < 0) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                        this.logUtil.putF("Not NameSpace key: " + key + " Value: " + value, this, "toHashMap()");
                    }
                    hashMap.put(key, value);
                } else {
                    document = this.addNameSpace(key, value, document);
                }
            } else if (Std.isOfType(this.getMap().get(key), haxe.ds.Vector)) {
                var values : haxe.ds.Vector<String> = (cast this.getMap().get(key) : haxe.ds.Vector<String>);
                if (key.indexOf(NameSpaceRequestParamData.NAME) < 0) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                        this.logUtil.putF("Not NameSpace key: " + key + " Value: " + values[0], this, "toHashMap()");
                    }
                    hashMap.put(key, values[0]);
                } else {
                    document = this.addNameSpace(key, values[0], document);
                }
            }
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("NameSpaceRequestParams: " + Std.string(this.getMap()) + "\ntoHashMap(): " + Std.string(hashMap) + "\nDocument Created: " + XmlDocumentHelper.toString(document), this, "toHashMap()");
        }
        hashMap.put(NameSpaceRequestParamData.DOCUMENT, document);
        return hashMap;
    }

}

