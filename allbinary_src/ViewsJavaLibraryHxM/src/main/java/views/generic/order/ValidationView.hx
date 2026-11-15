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

import org.allbinary.business.user.commerce.inventory.order.OrderHistoryFactory;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntity;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class ValidationView extends OrderView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            if (this.order.isIdValid() == false) {
                return false;
            } else {
                this.orderHistory = OrderHistoryFactory.getInstance(this.order.getId());
                if (this.orderHistory == null || this.orderHistory.isValid() == false) {
                    return false;
                }
                var orderItems : OrderItemsEntity = new OrderItemsEntity();
                this.basketReview = orderItems.getBasketReview(this.order.getId());
                if (this.basketReview == null || this.basketReview.isValid() == false) {
                    return false;
                }
            }
            return valid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to validate form", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (this.order.isIdValid() == false) {
                stringBuffer.append(this.order.getIdValidationInfo());
            } else {
                this.orderHistory = OrderHistoryFactory.getInstance(this.order.getId());
                if (this.orderHistory == null || this.orderHistory.isValid() == false) {
                    stringBuffer.append("Order History data error for: ");
                    stringBuffer.append(this.order.getId());
                    stringBuffer.append("<br />");
                }
                var orderItems : OrderItemsEntity = new OrderItemsEntity();
                this.basketReview = orderItems.getBasketReview(this.order.getId());
                if (this.basketReview == null) {
                    stringBuffer.append("Order Items data error - does not exist for: ");
                    stringBuffer.append(this.order.getId());
                    stringBuffer.append("<br />");
                } else if (this.basketReview.isValid() == false) {
                    stringBuffer.append("Order Items data error - not valid for: ");
                    stringBuffer.append(this.order.getId());
                    stringBuffer.append("<br />");
                }
            }
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Validating Form";
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

