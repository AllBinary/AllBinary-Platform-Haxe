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
package org.allbinary.input.automation.module.actions.script.condition.processors.output;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.input.media.image.InputImageType;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class ImageTypes {
    private var vector : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        var nodeList : NodeList = node.getChildNodes();
        for (index in 0...nodeList.getLength()) {
            var childNode : Node = nodeList.item(index);
            if (childNode.getNodeName().compareTo(ImageActionScriptOutputData.TYPE) == 0) {
                var nextImageTypeString : String = DomNodeHelper.getTextNodeValue(childNode);
                this.getVector().add(InputImageType.getInstance(nextImageTypeString));
            } else {
                throw new haxe.Exception("ImageTypes Unknown Node");
            }
        }
    }

    public static function valueOf(anyType : haxe.ds.Vector<Any>) : ImageTypes {
        var imageTypes : ImageTypes = new ImageTypes();
        for (index in 0...anyType.length) {
            var imageType : InputImageType = InputImageType.getInstance((cast anyType[index] : String));
            imageTypes.getVector().add(imageType);
        }
        return imageTypes;
    }

    public function getVector() : BasicArrayList {
        return this.vector;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        final newNode : Node = document.createElement(ImageActionScriptOutputData.TYPES);
        final size : Int = this.vector.size();
        for (index in 0...size) {
            var imageType : InputImageType = (cast this.vector.get(index) : InputImageType);
            newNode.appendChild(ModDomHelper.createTextNode(document, ImageActionScriptOutputData.TYPE, imageType.getName()));
        }
        return newNode;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("ImageTypes: ");
        final size : Int = this.vector.size();
        for (index in 0...size) {
            var imageType : InputImageType = (cast this.vector.get(index) : InputImageType);
            stringBuffer.append(imageType.getName());
            if (index < size - 1) {
                stringBuffer.append(", ");
            }
        }
        return stringBuffer.toString();
    }

}

