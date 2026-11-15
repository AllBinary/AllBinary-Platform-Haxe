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
package org.allbinary.business.user.commerce.money.tax;

import org.allbinary.business.DynamicObjectData;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.money.tax.components.TaxData;
import org.allbinary.business.user.commerce.money.tax.modules.SimpleStateTaxModule;
import org.allbinary.business.user.commerce.money.tax.modules.TaxModuleInterface;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class TaxFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TaxFactory = new TaxFactory();
    public static function getInstance() : TaxFactory {
        return TaxFactory.instance;
    }

    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final TAXATIONFILENAME : String = "taxationMethod.xml";
    public function new() {
    }

    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, storeFrontInterface : StoreFrontInterface) : TaxModuleInterface {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(URLGLOBALS.getMainPath());
        stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
        stringBuffer.append(storeFrontInterface.getName());
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        stringBuffer.append("generic");
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        stringBuffer.append("taxes");
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        final abPath : AbPath = new AbPath(Std.string(stringBuffer), TAXATIONFILENAME);
        final transformInfoObjectConfigData : TransformInfoObjectConfigData = TransformInfoObjectConfigData.getInstance();
        final data : String = new CryptFileReader(transformInfoObjectConfigData.UNCRYPTED_EXTENSION, transformInfoObjectConfigData.ENCRYPTED_EXTENSION).get(abPath);
        final document : Document = DomDocumentHelper.create(data);
        final taxNameNodeList : NodeList = document.getElementsByTagName(TaxData.NAME);
        for (index in 0...taxNameNodeList.getLength()) {
            final node : Node = taxNameNodeList.item(index);
            final nodeList : NodeList = node.getChildNodes();
            if (nodeList != null) {
                final classNameNode : Node = DomSearchHelper.getNode(DynamicObjectData.NAME, nodeList);
                if (classNameNode != null) {
                    final className : String = DomNodeHelper.getTextNodeValue(classNameNode);
                    return (cast AbeFactory.getInstance().getInstance(abeClientInformation, className) : TaxModuleInterface);
                } else {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAX)) {
                        this.logUtil.putF("Class Node Null", this, this.commonStrings.GET_INSTANCE);
                    }
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAX)) {
                    this.logUtil.putF("Tax Name Node Node Children", this, this.commonStrings.GET_INSTANCE);
                }
            }
        }
        return (cast new SimpleStateTaxModule() : TaxModuleInterface);
    }

}

