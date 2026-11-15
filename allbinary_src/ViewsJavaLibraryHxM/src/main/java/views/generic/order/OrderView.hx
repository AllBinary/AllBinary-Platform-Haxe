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
package views.generic.order;

//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.commerce.inventory.basket.Basket;
import org.allbinary.business.user.commerce.inventory.basket.BasketReview;
import org.allbinary.business.user.commerce.inventory.order.Order;
import org.allbinary.business.user.commerce.inventory.order.OrderData;
import org.allbinary.business.user.commerce.inventory.order.OrderHistory;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class OrderView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var request : HttpServletRequest;
    public var order : Order = null;
    public var orderHistory : OrderHistory = null;
    public var basketReview : BasketReview = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.request = (cast this.getPageContext().getRequest() : HttpServletRequest);
        this.getFormData();
    }

    // throws Exception
    private function getFormData() : Void {
        var id : String = this.request.getParameter(OrderData.ID);
        if (id == null) {
            id = this.getWeblisketSession().getOrder().getId();
        }
        this.order = new Order(new Basket());
        this.order.setId(id);
    }

    public function toXmlNode(document : Document) : Node {
        try {
            var orderHistoryNode : Node = this.orderHistory.toXmlNode(document);
            var node : Node = document.createElement(this.orderHistory.getPaymentMethod());
            orderHistoryNode.appendChild(this.basketReview.toXmlNode(document));
            node.appendChild(orderHistoryNode);
            return node;
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

