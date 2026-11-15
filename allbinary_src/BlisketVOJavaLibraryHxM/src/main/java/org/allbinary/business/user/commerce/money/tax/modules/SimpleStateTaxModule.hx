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
package org.allbinary.business.user.commerce.money.tax.modules;

import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.address.StreetAddressData;
import org.allbinary.business.user.commerce.money.tax.components.TaxData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class SimpleStateTaxModule implements TaxModuleInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var streetAddress : StreetAddress = null;
    private var storeFrontInterface : StoreFrontInterface = null;
    private final ALL : String = CommonPhoneStrings.getInstance().STAR;
    private final STATETAXPATH : String = "/generic/taxes/";
    private final STATETAXFILE : String = "stateTaxation.xml";
    private var document : Document = null;
    public function new() {
    }

    // throws Exception
    public function getTaxRate(streetAddress : StreetAddress, storeFrontInterface : StoreFrontInterface) : Null<Float> {
        this.streetAddress = streetAddress;
        this.storeFrontInterface = storeFrontInterface;
        var fileAbPath : AbPath = new AbPath(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH + this.storeFrontInterface.getName() + this.STATETAXPATH, this.STATETAXFILE);
        var data : String = new CryptFileReader(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION).get(fileAbPath);
        this.document = DomDocumentHelper.create(data);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAX)) {
            this.logUtil.putF("Tax Doc: " + XmlDocumentHelper.toString(this.document), this, "getTaxRate");
        }
        var state : String = this.streetAddress.getState();
        var country : String = this.streetAddress.getCountry();
        state = state.toUpperCase();
        var nodeList : NodeList = this.document.getElementsByTagName(TaxData.NAME);
        for (index in 0...nodeList.getLength()) {
            var node : Node = nodeList.item(index);
            var taxNodeChildren : NodeList = node.getChildNodes();
            var streetAddressNode : Node = DomSearchHelper.getNode(StreetAddressData.NAME, taxNodeChildren);
            var taxableStreetAddress : StreetAddress = new StreetAddress(streetAddressNode);
            var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            if (!stringValidationUtil.isEmpty(country) && !stringValidationUtil.isEmpty(taxableStreetAddress.getCountry()) && Reflect.compare(country, taxableStreetAddress.getCountry()) == 0) {
                if (state != null && taxableStreetAddress.getState() != null && Reflect.compare(state, taxableStreetAddress.getState()) == 0) {
                    var rateNode : Node = DomSearchHelper.getNode(TaxData.RATE, taxNodeChildren);
                    var taxRate : String = DomNodeHelper.getTextNodeValue(rateNode);
                    var taxRateFloat : Null<Float> = taxRate * .01;
                    return taxRateFloat;
                }
            }
        }
        return 0;
    }

    public function isValid(streetAddress : StreetAddress, storeFrontInterface : StoreFrontInterface) : Null<Bool> {
        try {
            this.streetAddress = streetAddress;
            this.storeFrontInterface = storeFrontInterface;
            var fileAbPath : AbPath = new AbPath(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH + this.storeFrontInterface.getName() + this.STATETAXPATH, this.STATETAXFILE);
            var data : String = new CryptFileReader(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION).get(fileAbPath);
            this.document = DomDocumentHelper.create(data);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAX)) {
                this.logUtil.putF("Tax Doc: " + XmlDocumentHelper.toString(this.document), this, this.commonStrings.IS_VALID);
            }
            var country : String = this.streetAddress.getCountry();
            var rootNode : Node = this.document.getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME).item(0);
            var nodeList : NodeList = this.document.getElementsByTagName(TaxData.NAME);
            for (index in 0...nodeList.getLength()) {
                var node : Node = nodeList.item(index);
                var taxNodeChildren : NodeList = node.getChildNodes();
                var streetAddressNode : Node = DomSearchHelper.getNode(StreetAddressData.NAME, taxNodeChildren);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAX)) {
                    final stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("StreetAddress Node: ");
                    stringBuffer.append(streetAddressNode.getNodeName());
                    stringBuffer.append(" Value: ");
                    stringBuffer.append(streetAddressNode.getNodeValue());
                    stringBuffer.append(" Number Of Children: ");
                    stringBuffer.appendint(Std.int(streetAddressNode.getChildNodes().getLength()));
                    this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.IS_VALID);
                }
                var taxableStreetAddress : StreetAddress = new StreetAddress(streetAddressNode);
                var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
                if (!stringValidationUtil.isEmpty(country) && !stringValidationUtil.isEmpty(taxableStreetAddress.getCountry()) && taxableStreetAddress.getCountry().compareTo(this.ALL) == 0) {
                    return true;
                }
                if (!stringValidationUtil.isEmpty(country) && !stringValidationUtil.isEmpty(taxableStreetAddress.getCountry()) && Reflect.compare(country, taxableStreetAddress.getCountry()) == 0) {
                    var state : String = this.streetAddress.getState();
                    if (state != null) {
                        return true;
                    }
                }
            }
            return false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to validate", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

}

