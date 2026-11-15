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
package views.generic.shipping;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.business.user.commerce.money.tax.TaxFactory;
import org.allbinary.business.user.commerce.shipping.ShippingMethods;
import org.allbinary.business.user.commerce.shipping.ShippingMethodsData;
import org.allbinary.business.user.commerce.shipping.modules.ShippingInterface;
import org.allbinary.data.tables.user.address.StreetAddressesEntityInterface;
import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class ShippingMethodsView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var shippingMethods : ShippingMethods;
    private var storeFrontInterface : StoreFrontInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.storeFrontInterface = StoreFrontFactory.getInstance(this.getTransformInfoInterface().getStoreName());
        this.shippingMethods = new ShippingMethods(this.abeClientInformation, this.storeFrontInterface);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        try {
            var shippingMethodsNode : Node = document.createElement(ShippingMethodsData.SHIPPINGMETHODSORDERSUMMARIES);
            var order : OrderInterface = this.getWeblisketSession().getOrder();
            var basket : BasketInterface = this.getWeblisketSession().getOrder().getBasket();
            var shippingAddressesEntityInterface : StreetAddressesEntityInterface = ShippingAddressesEntityFactory.getInstance().getInstance(this.getWeblisketSession().getUserName());
            var streetAddress : StreetAddress = shippingAddressesEntityInterface.getDefault();
            var shippingVector : BasicArrayList = this.shippingMethods.get();
            final size : Int = shippingVector.size();
            for (index in 0...size) {
                var shippingMethodNode : Node = document.createElement(ShippingMethodsData.SHIPPINGMETHODORDERSUMMARY);
                var shipping : ShippingInterface = (cast shippingVector.get(index) : ShippingInterface);
                var shippingView : DomNodeInterface = (cast shipping : DomNodeInterface);
                shippingMethodNode.appendChild(shippingView.toXmlNode(document));
                var shippingCost : Money = shipping.getCost(order);
                var subTotal : Money = basket.getSubTotal();
                var taxRate : Null<Float> = TaxFactory.getInstance().getInstance(this.abeClientInformation, storeFrontInterface).getTaxRate(streetAddress, storeFrontInterface);
                var tax : Money = new Money();
                var total : Money = new Money();
                total.add(Std.string(shippingCost));
                total.add(Std.string(subTotal));
                tax.add(Std.string(total));
                tax.multiply(taxRate);
                total.add(Std.string(tax));
                shippingMethodNode.appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.SHIPPINGCOST, Std.string(shippingCost)));
                shippingMethodNode.appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.TAXRATE, Std.string(taxRate)));
                shippingMethodNode.appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.SUBTOTAL, Std.string(subTotal)));
                shippingMethodNode.appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.TAX, Std.string(tax)));
                shippingMethodNode.appendChild(ModDomHelper.createNameValueNodes(document, ShippingMethodsData.TOTAL, Std.string(total)));
                shippingMethodNode.appendChild(ModDomHelper.createNameValueNodes(document, EntryData.getInstance().DEFAULT, this.shippingMethods.getDefault().getName()));
                shippingMethodsNode.appendChild(shippingMethodNode);
            }
            return shippingMethodsNode;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XSLLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "toXmlNode", e);
            }
            throw e;
        }
    }

    public function addDomNodeInterfaces() : Void {
        this.addDomNodeInterface((cast this : DomNodeInterface));
    }

    public function view() : String {
        try {
            this.addDomNodeInterfaces();
            return super.view();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view ShippingMethods";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            return error;
        }
    }

}

