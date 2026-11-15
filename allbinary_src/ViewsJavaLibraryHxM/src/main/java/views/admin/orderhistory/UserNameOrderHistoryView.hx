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
package views.admin.orderhistory;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.commerce.inventory.order.OrderData;
import org.allbinary.business.user.commerce.inventory.order.OrderHistory;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.business.user.username.UserName;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class UserNameOrderHistoryView extends HttpStoreComponentView implements ValidationComponentInterface implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var request : HttpServletRequest;
    private var userName : String;
    private var shipped : String;
    private var partiallyShipped : String;
    private var processing : String;
    private var preprocessing : String;
    private var cancelled : String;
    private final ON : String = "on";
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.request = (cast this.getPageContext().getRequest() : HttpServletRequest);
        this.userName = this.request.getParameter(UserData.USERNAME);
        this.preprocessing = this.request.getParameter(OrderHistoryData.PREPROCESSINGNAME);
        this.shipped = this.request.getParameter(OrderHistoryData.SHIPPEDNAME);
        this.partiallyShipped = this.request.getParameter(OrderHistoryData.PARTIALLYSHIPPEDNAME);
        this.processing = this.request.getParameter(OrderHistoryData.PROCESSINGNAME);
        this.cancelled = this.request.getParameter(OrderHistoryData.CANCELLEDNAME);
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

    public function toXmlNode(document : Document) : Node {
        try {
            var node : Node = document.createElement(OrderData.ORDERS);
            var orderHistoryEntity : OrderHistoryEntity = new OrderHistoryEntity();
            var orderReviewVector : BasicArrayList = orderHistoryEntity.getOrders(this.userName);
            var size : Int = orderReviewVector.size();
            for (index in 0...size) {
                var orderHistory : OrderHistory = (cast orderReviewVector.get(index) : OrderHistory);
                var orderHistoryNode : Node = orderHistory.toXmlNode(document);
                var orderNode : Node = document.createElement(orderHistory.getPaymentMethod());
                node.appendChild(orderHistory.toXmlNode(document));
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Attempt to View a users order history", this, "view");
            }
            node.appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.PREPROCESSINGNAME, OrderHistoryData.PREPROCESSING));
            node.appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.PROCESSINGNAME, OrderHistoryData.PROCESSING));
            node.appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.CANCELLEDNAME, OrderHistoryData.CANCELLED));
            node.appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.PARTIALLYSHIPPEDNAME, OrderHistoryData.PARTIALLYSHIPPED));
            node.appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.SHIPPEDNAME, OrderHistoryData.SHIPPED));
            node.appendChild(ModDomHelper.createNameValueNodes(document, GLOBALS2.VIEWNAME, GLOBALS2.VIEW));
            return node;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XSLLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "toXmlNode", e);
            }
            return null;
        }
    }

    public function isValid() : Null<Bool> {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Started", this, this.commonStrings.IS_VALID);
        }
        if (UserName.getInstance().isValid(this.userName) == true) {
            return true;
        }
        return false;
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    public function validationInfo() : String {
        if (this.userName == null) {
            return "No User Name Specified<br />";
        }
        if (UserName.getInstance().isValid(this.userName) == false) {
            return "Invalid User Name<br />";
        }
        return "Unknown Error<br />";
    }

}

