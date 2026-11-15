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

import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.path.AbPath;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class ContextConfigurationInterfaceFactory {
    private static final instance : ContextConfigurationInterfaceFactory = new ContextConfigurationInterfaceFactory();
    public static function getInstance() : ContextConfigurationInterfaceFactory {
        return ContextConfigurationInterfaceFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getInstance(document : Document) : ContextConfigurationInterface {
        final contextConfigurationData : ContextConfigurationData = ContextConfigurationData.getInstance();
        final contextConfigurationNode : Node = DomSearchHelper.getNode(contextConfigurationData.NAME, document.getChildNodes());
        return (cast new ContextConfigurationView(contextConfigurationNode).getContextConfigurationInterface() : ContextConfigurationInterface);
    }

    // throws Exception
    public function getInstance(contextName : String) : ContextConfigurationInterface {
        final abPath : AbPath = ContextConfigurationPathUtil.getAbPath(contextName);
        final contextConfigurationData : ContextConfigurationData = ContextConfigurationData.getInstance();
        final documentString : String = new CryptFileReader(contextConfigurationData.UNCRYPTED_EXTENSION, contextConfigurationData.ENCRYPTED_EXTENSION).get(abPath);
        final document : Document = DomDocumentHelper.create(documentString);
        return this.getInstance(document);
    }

}

