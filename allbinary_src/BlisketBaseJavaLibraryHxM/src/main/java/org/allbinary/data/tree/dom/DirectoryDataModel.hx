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

import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.logic.visual.transform.data.TransformDocumentFactory;
import org.allbinary.logic.visual.transform.data.TransformDocumentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.util.BasicArrayList;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class DirectoryDataModel implements DomNodeInterface implements TransformInterface {
    private final fileBasicArrayList : BasicArrayList;
    private var transformDocumentInterface : TransformDocumentInterface;
    public function new(file : AbFile) {
        this.fileBasicArrayList = Directory.getInstance().search(file);
        this.transformDocumentInterface = (cast TransformDocumentFactory.getInstance() : TransformDocumentInterface);
    }

    public var NO_TYPE : Int = 0;
    public function getTypeId() : Int {
        return this.NO_TYPE;
    }

    // throws Exception
    public function getTransformInfoInterface() : TransformInfoInterface {
        return null;
    }

    public function setTransformDocumentInterface(transformDocumentInterface : TransformDocumentInterface) : Void {
        this.transformDocumentInterface = transformDocumentInterface;
    }

    public function getTransformDocumentInterface() : TransformDocumentInterface {
        return this.transformDocumentInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        final dirNode : Node = document.createElement("dir");
        final size : Int = this.fileBasicArrayList.size();
        var nextFile : AbFile = null;
        var fileNode : Node = null;
        for (index in 0...size) {
            nextFile = (cast this.fileBasicArrayList.get(index) : AbFile);
            fileNode = new FileDomDataModel(nextFile).toXmlNode(document);
            dirNode.appendChild(fileNode);
        }
        return dirNode;
    }

    // throws Exception
    public function toXmlDoc() : Document {
        return this.getTransformDocumentInterface().getDoc();
    }

    // throws Exception
    public function view() : String {
        var node : Node = this.toXmlNode(this.getTransformDocumentInterface().getDoc());
        this.getTransformDocumentInterface().getBaseNode().appendChild(node);
        return XmlDocumentHelper.toString(this.getTransformDocumentInterface().getDoc());
    }

}

