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
package org.allbinary.business.user.commerce.shipping;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.DynamicObjectData;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.shipping.modules.BasicWeightShippingModuleView;
import org.allbinary.business.user.commerce.shipping.modules.NoShippingModuleView;
import org.allbinary.business.user.commerce.shipping.modules.ShippingInterface;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class ShippingMethodsFactory {
    private var defaultShippingMethodInterface : ShippingInterface = null;
    private static final SHIPPINGMETHODSFILEPATHSTRING : String = null;
    static function __init__() {
        final stringBuffer : StringMaker = new StringMaker();
        final sep : String = AbPathData.getInstance().SEPARATOR;
        stringBuffer.append(sep);
        stringBuffer.append("generic");
        stringBuffer.append(sep);
        stringBuffer.append("shipping");
        stringBuffer.append(sep);
        SHIPPINGMETHODSFILEPATHSTRING = Std.string(stringBuffer);
    }
    private static final SHIPPINGMETHODSFILENAME : String = "shippingMethods.xml";
    private var document : Document;
    private var shippingVector : BasicArrayList;
    public function new(abeClientInformation : AbeClientInformationInterface, storeFrontInterface : StoreFrontInterface) {
        final stringBuffer : StringMaker = new StringMaker();
        final sep : String = AbPathData.getInstance().SEPARATOR;
        stringBuffer.append(URLGLOBALS.getMainPath());
        stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
        stringBuffer.append(storeFrontInterface.getName());
        stringBuffer.append(sep);
        stringBuffer.append(ShippingMethodsFactory.SHIPPINGMETHODSFILEPATHSTRING);
        final abPath : AbPath = (cast new AbPath(Std.string(stringBuffer), this.SHIPPINGMETHODSFILENAME) : AbPath);
        final data : String = new CryptFileReader(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION).get(abPath);
        this.document = DomDocumentHelper.create(data);
        this.shippingVector = new BasicArrayListD();
        final nodeList : NodeList = this.document.getElementsByTagName(ShippingMethodsData.NAME);
        for (index in 0...nodeList.getLength()) {
            final node : Node = nodeList.item(index);
            final shippingMethodNodeChildren : NodeList = node.getChildNodes();
            final shippingMethodNameNode : Node = DomSearchHelper.getNode(ShippingMethodData.NAME, shippingMethodNodeChildren);
            final classNameNode : Node = DomSearchHelper.getNode(DynamicObjectData.NAME, shippingMethodNameNode.getChildNodes());
            final shippingMethodClassName : String = DomNodeHelper.getTextNodeValue(classNameNode);
            final shippingMethodInterface : ShippingInterface = (cast AbeFactory.getInstance().getInstance(abeClientInformation, shippingMethodClassName) : ShippingInterface);
            this.shippingVector.add(shippingMethodInterface);
            final defaultShippingMethodNameNode : Node = DomSearchHelper.getNode(ShippingMethodData.DEFAULT, shippingMethodNameNode.getChildNodes());
            final defaultShippingMethodNameNodeValue : String = DomNodeHelper.getTextNodeValue(defaultShippingMethodNameNode);
            if (defaultShippingMethodNameNodeValue != null && Reflect.compare(defaultShippingMethodNameNodeValue, ShippingMethodData.DEFAULT) == 0) {
                this.defaultShippingMethodInterface = shippingMethodInterface;
            }
        }
        if (this.shippingVector.size() < 1) {
            this.defaultShippingMethodInterface = new BasicWeightShippingModuleView();
            this.shippingVector.add(this.defaultShippingMethodInterface);
            this.shippingVector.add(new NoShippingModuleView());
        }
    }

    // throws Exception
    public function getInstance() : BasicArrayList {
        return this.shippingVector;
    }

    public function getDefaultInstance() : ShippingInterface {
        return this.defaultShippingMethodInterface;
    }

}

