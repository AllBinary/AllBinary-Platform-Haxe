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

//import java.util.Calendar;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.commerce.inventory.order.OrderData;
import org.allbinary.business.user.commerce.inventory.order.OrderHistory;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.time.TimeUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class DateRangeOrderHistoryView extends HttpStoreComponentView implements ValidationComponentInterface implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final VIEWALLORDERS : String = "View All";
    private final VIEWORDERSINLASTHOUR : String = "Last Hour";
    private final VIEWORDERSINLASTDAY : String = "Last Day";
    private final VIEWORDERSINLASTWEEK : String = "Last Week";
    private final VIEWORDERSINLAST30DAYS : String = "30 Days";
    private var request : HttpServletRequest;
    private var shipped : String = null;
    private var partiallyShipped : String = null;
    private var processing : String = null;
    private var preprocessing : String = null;
    private var cancelled : String = null;
    private var dateType : String = null;
    private var toDate : String = null;
    private var fromDate : String = null;
    private var fromYear : String = null;
    private var fromMonth : String = null;
    private var fromDay : String = null;
    private var fromHour : String = null;
    private var toYear : String = null;
    private var toMonth : String = null;
    private var toDay : String = null;
    private var toHour : String = null;
    private var command : String = null;
    private final ON : String = "on";
    private var MAXLEN : Int = 15;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.request = (cast this.getPageContext().getRequest() : HttpServletRequest);
        this.getFormData();
    }

    private function getFormData() : Void {
        this.dateType = this.request.getParameter(OrderHistoryData.DATETYPE);
        this.preprocessing = this.request.getParameter(OrderHistoryData.PREPROCESSINGNAME);
        this.shipped = this.request.getParameter(OrderHistoryData.SHIPPEDNAME);
        this.partiallyShipped = this.request.getParameter(OrderHistoryData.PARTIALLYSHIPPEDNAME);
        this.processing = this.request.getParameter(OrderHistoryData.PROCESSINGNAME);
        this.cancelled = this.request.getParameter(OrderHistoryData.CANCELLEDNAME);
        this.fromYear = this.request.getParameter(OrderHistoryData.FROMYEAR);
        this.fromMonth = this.request.getParameter(OrderHistoryData.FROMMONTH);
        this.fromDay = this.request.getParameter(OrderHistoryData.FROMDAY);
        this.fromHour = this.request.getParameter(OrderHistoryData.FROMHOUR);
        this.toYear = this.request.getParameter(OrderHistoryData.TOYEAR);
        this.toMonth = this.request.getParameter(OrderHistoryData.TOMONTH);
        this.toDay = this.request.getParameter(OrderHistoryData.TODAY);
        this.toHour = this.request.getParameter(OrderHistoryData.TOHOUR);
        this.command = this.request.getParameter(GLOBALS2.ADMINCOMMAND);
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
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Attempt to View orders in (fromDate=");
                stringBuffer.append(this.fromDate);
                stringBuffer.append(",toDate=");
                stringBuffer.append(this.toDate);
                stringBuffer.append(") and status");
                this.logUtil.putF(Std.string(stringBuffer), this, "view");
            }
            var node : Node = document.createElement(OrderData.ORDERS);
            if (this.preprocessing != null && Reflect.compare(this.preprocessing, this.ON) == 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Adding Preprocessing Orders", this, "toXmlNode");
                }
                var orderHistoryVector : BasicArrayList = OrderHistoryEntityFactory.getInstance().getOrders(OrderHistoryData.PREPROCESSING, fromDate, toDate);
                final size : Int = orderHistoryVector.size();
                for (index in 0...size) {
                    var orderHistory : OrderHistory = (cast orderHistoryVector.get(index) : OrderHistory);
                    node.appendChild(orderHistory.toXmlNode(document));
                }
            }
            if (this.shipped != null && Reflect.compare(this.shipped, this.ON) == 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Adding Shipped Orders", this, "toXmlNode");
                }
                var orderHistoryVector : BasicArrayList = OrderHistoryEntityFactory.getInstance().getOrders(OrderHistoryData.SHIPPED, fromDate, toDate);
                final size : Int = orderHistoryVector.size();
                for (index in 0...size) {
                    var orderHistory : OrderHistory = (cast orderHistoryVector.get(index) : OrderHistory);
                    node.appendChild(orderHistory.toXmlNode(document));
                }
            }
            if (this.partiallyShipped != null && Reflect.compare(this.partiallyShipped, this.ON) == 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Adding Partially Shipped Orders", this, "toDomNode");
                }
                var orderHistoryVector : BasicArrayList = OrderHistoryEntityFactory.getInstance().getOrders(OrderHistoryData.PARTIALLYSHIPPED, fromDate, toDate);
                final size : Int = orderHistoryVector.size();
                for (index in 0...size) {
                    var orderHistory : OrderHistory = (cast orderHistoryVector.get(index) : OrderHistory);
                    node.appendChild(orderHistory.toXmlNode(document));
                }
            }
            if (this.processing != null && Reflect.compare(this.processing, this.ON) == 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Adding Processing Orders", this, "toXmlNode");
                }
                var orderHistoryVector : BasicArrayList = OrderHistoryEntityFactory.getInstance().getOrders(OrderHistoryData.PROCESSING, fromDate, toDate);
                final size : Int = orderHistoryVector.size();
                for (index in 0...size) {
                    var orderHistory : OrderHistory = (cast orderHistoryVector.get(index) : OrderHistory);
                    node.appendChild(orderHistory.toXmlNode(document));
                }
            }
            if (this.cancelled != null && Reflect.compare(this.cancelled, this.ON) == 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Adding Cancelled Orders", this, "view");
                }
                var orderHistoryVector : BasicArrayList = OrderHistoryEntityFactory.getInstance().getOrders(OrderHistoryData.CANCELLED, fromDate, toDate);
                final size : Int = orderHistoryVector.size();
                for (index in 0...size) {
                    var orderHistory : OrderHistory = (cast orderHistoryVector.get(index) : OrderHistory);
                    node.appendChild(orderHistory.toXmlNode(document));
                }
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
        try {
            var isValid : Null<Bool> = true;
            if (this.dateType == null || (Reflect.compare(this.dateType, OrderHistoryData.TYPELONG) != 0 && Reflect.compare(this.dateType, OrderHistoryData.TYPECAESAR) != 0)) {
                isValid = false;
            }
            if (this.dateType != null) {
                if (Reflect.compare(this.dateType, OrderHistoryData.TYPELONG) == 0) {
                    var calendar : Calendar = Calendar.getInstance();
                    var currentTime : haxe.Int64 = calendar.getTimeInMillis();
                    var rangeDate : String = StringUtil.getInstance().EMPTY_STRING;
                    if (Reflect.compare(this.command, this.VIEWORDERSINLASTHOUR) == 0) {
                        var oneHour : haxe.Int64 = 60 * 60 * 1000;
                        rangeDate = Std.string(oneHour);
                    } else if (Reflect.compare(this.command, this.VIEWORDERSINLASTDAY) == 0) {
                        var oneDay : haxe.Int64 = 24 * 60 * 60 * 1000;
                        rangeDate = Std.string(oneDay);
                    } else if (Reflect.compare(this.command, this.VIEWORDERSINLASTWEEK) == 0) {
                        var oneWeek : haxe.Int64 = 7 * 24 * 60 * 60 * 1000;
                        rangeDate = Std.string(oneWeek);
                    } else if (Reflect.compare(this.command, this.VIEWORDERSINLAST30DAYS) == 0) {
                        var thirtyDays : haxe.Int64 = 30 * 24 * 60 * 60 * 1000;
                        rangeDate = Std.string(thirtyDays);
                    } else if (Reflect.compare(this.command, this.VIEWALLORDERS) == 0) {
                        rangeDate = Std.string(currentTime);
                    }
                    var rangeDateLong : haxe.Int64 = haxe.Int64.ofInt(rangeDate);
                    this.fromDate = Std.string(currentTime - rangeDateLong);
                    var time : String = Std.string(currentTime);
                    this.toDate = time;
                } else if (Reflect.compare(this.dateType, OrderHistoryData.TYPECAESAR) == 0) {
                    var calendar : Calendar = Calendar.getInstance();
                    TimeUtil.getInstance().setCalendar(calendar, this.fromYear, this.fromMonth, this.fromDay, this.fromHour);
                    this.fromDate = Std.string(calendar.getTimeInMillis());
                    TimeUtil.getInstance().setCalendar(calendar, this.toYear, this.toMonth, this.toDay, this.toHour);
                    this.toDate = Std.string(calendar.getTimeInMillis());
                }
                if (StringValidationUtil.getInstance().isEmpty(this.toDate) || this.toDate.length > this.MAXLEN) {
                    isValid = false;
                }
                if (StringValidationUtil.getInstance().isEmpty(this.fromDate) || this.fromDate.length > this.MAXLEN) {
                    isValid = false;
                }
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Attempt to View orders in (fromDate=");
                stringBuffer.append(this.fromDate);
                stringBuffer.append(",toDate=");
                stringBuffer.append(this.toDate);
                stringBuffer.append(")");
                this.logUtil.putF(Std.string(stringBuffer), this, this.commonStrings.IS_VALID);
            }
            return isValid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.put("Exception in validation", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    // throws Exception
    public function validationInfo() : String {
        try {
            var result : StringMaker = new StringMaker();
            if (this.dateType == null || (Reflect.compare(this.dateType, OrderHistoryData.TYPELONG) != 0 && Reflect.compare(this.dateType, OrderHistoryData.TYPECAESAR) != 0)) {
                result.append("DATETYPE not recognized");
            }
            if (StringValidationUtil.getInstance().isEmpty(this.toDate) || this.toDate.length > this.MAXLEN) {
                result.append("Invalid To Date");
            }
            if (StringValidationUtil.getInstance().isEmpty(this.fromDate) || this.fromDate.length > this.MAXLEN) {
                result.append("Invalid From Date");
            }
            return Std.string(result);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Getting Validation Info";
        }
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

