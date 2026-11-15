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
package org.allbinary.business.context.configuration;

import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class ContextConfigurationDomDocumentMapping implements DomDocumentMappingInterface {
    private var contextConfigurationInterface : ContextConfigurationInterface;
    public function new(contextConfigurationInterface : ContextConfigurationInterface) {
        this.contextConfigurationInterface = contextConfigurationInterface;
    }

    // throws Exception
    public function toXmlDoc() : Document {
        var document : Document = DomDocumentHelper.create();
        var node : Node = new ContextConfigurationView(this.contextConfigurationInterface).toXmlNode(document);
        document.appendChild(node);
        return document;
    }

    // throws Exception
    public function toDomDocumentString() : String {
        return XmlDocumentHelper.toString(this.toXmlDoc());
    }

}

