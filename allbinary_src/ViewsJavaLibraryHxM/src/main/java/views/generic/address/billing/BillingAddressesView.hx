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
package views.generic.address.billing;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.address.BillingAddressData;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.address.StreetAddressData;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class BillingAddressesView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var request : HttpServletRequest;
    public var streetAddresses : BasicArrayList = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        var httpTransformInfoInterface : TransformInfoHttpInterface = (cast this.getTransformInfoInterface() : TransformInfoHttpInterface);
        this.request = (cast httpTransformInfoInterface.getPageContext().getRequest() : HttpServletRequest);
    }

    public function getRequest() : HttpServletRequest {
        return this.request;
    }

    public function toXmlNode(document : Document) : Node {
        try {
            var billingAddressesNode : Node = document.createElement(BillingAddressData.MULTIPLE);
            var size : Int = this.streetAddresses.size();
            for (index in 0...size) {
                var streetAddress : StreetAddress = (cast this.streetAddresses.get(index) : StreetAddress);
                billingAddressesNode.appendChild(streetAddress.toXmlNode(document));
            }
            billingAddressesNode.appendChild(ModDomHelper.createNameValueNodes(document, StreetAddressData.NUMBEROFADDRESSES, Std.string(streetAddresses.size())));
            return billingAddressesNode;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XSLLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "toXmlNode", e);
            }
            return null;
        }
    }

    public function addDomNodeInterfaces() : Void {
        this.addDomNodeInterface((cast this : DomNodeInterface));
    }

    // throws Exception
    public function view() : String {
        try {
            this.addDomNodeInterfaces();
            return super.view();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

}

