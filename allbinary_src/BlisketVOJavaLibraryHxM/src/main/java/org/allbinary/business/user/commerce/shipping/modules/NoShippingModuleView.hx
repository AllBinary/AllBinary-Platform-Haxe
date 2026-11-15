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
package org.allbinary.business.user.commerce.shipping.modules;

import org.allbinary.business.user.commerce.shipping.ShippingMethodData;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.w3c.dom.Node;

class NoShippingModuleView extends NoShippingModule implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        super();
    }

    public function isValid() : Null<Bool> {
        return null;
    }

    public function toValidationInfoDoc() : org.w3c.dom.Document {
        return null;
    }

    public function toValidationInfoNode(document : org.w3c.dom.Document) : org.w3c.dom.Node {
        return null;
    }

    public function toXmlDoc() : org.w3c.dom.Document {
        return null;
    }

    public function toXmlNode(document : org.w3c.dom.Document) : org.w3c.dom.Node {
        try {
            var shippingMethodNode : Node = document.createElement(ShippingMethodData.NAME);
            shippingMethodNode.appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodData.NAME, this.getName()));
            shippingMethodNode.appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodData.DESCRIPTION, this.getDescription()));
            return shippingMethodNode;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "toXmlNode", e);
            }
            return null;
        }
    }

    public function validationInfo() : String {
        return null;
    }

    public function view() : String {
        return null;
    }

}

