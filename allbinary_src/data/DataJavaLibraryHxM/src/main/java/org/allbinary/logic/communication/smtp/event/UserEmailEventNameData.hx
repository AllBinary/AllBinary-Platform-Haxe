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
package org.allbinary.logic.communication.smtp.event;

//import java.util.HashMap;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.logic.StdUtil;

class UserEmailEventNameData {
    private static var userNameEvenNameHashMap : HashMap = StdUtil.getInstance().createHashMap();
    private static var nextId : Int = 0;
    private var eventNameId : Int = 0;
    private var eventHandlerName : String;
    public function new(eventHandlerName : String) {
        this.eventHandlerName = eventHandlerName;
        this.initNextId();
        UserEmailEventNameData.userNameEvenNameHashMap.put(this.eventHandlerName, this);
    }

    // synchronized
    private function initNextId() : Void {
        this.eventNameId = UserEmailEventNameData.nextId;
        UserEmailEventNameData.nextId++;
    }

    public static final INSTALLER : UserEmailEventNameData = new UserEmailEventNameData("Installer");
    public static final EXCEPTION : UserEmailEventNameData = new UserEmailEventNameData("Exception");
    public static final LOGGEDEXCEPTION : UserEmailEventNameData = new UserEmailEventNameData("Logged Exception");
    public static final ERROR : UserEmailEventNameData = new UserEmailEventNameData("Error");
    public static final OUTOFMEMORY : UserEmailEventNameData = new UserEmailEventNameData("Out Of Memory Error");
    public static final ADMINGENERATINGSTATICPAGES : UserEmailEventNameData = new UserEmailEventNameData("Admin Generating Static Pages");
    public static final STOREERROROCCURRED : UserEmailEventNameData = new UserEmailEventNameData("Store Error Occurred");
    public static final STOREOUTOFMEMORY : UserEmailEventNameData = new UserEmailEventNameData("Store Out Of Memory Error");
    public static final STORECREATED : UserEmailEventNameData = new UserEmailEventNameData("Store Created");
    public static final STOREOPENED : UserEmailEventNameData = new UserEmailEventNameData("Store Opened");
    public static final STORECLOSED : UserEmailEventNameData = new UserEmailEventNameData("Store Closed");
    public static final STOREGENERATINGSTATICPAGES : UserEmailEventNameData = new UserEmailEventNameData("Store Generating Static Pages");
    public static final PRODUCTISOUT : UserEmailEventNameData = new UserEmailEventNameData("Product Is Out");
    public static final PRODUCTISAVAILABLE : UserEmailEventNameData = new UserEmailEventNameData("Product Is Available");
    public static final PRODUCTISOLD : UserEmailEventNameData = new UserEmailEventNameData("Product Is Old");
    public static final PRODUCTISONSALE : UserEmailEventNameData = new UserEmailEventNameData("Product Is On Sale");
    public static final PRODUCTSALEISOVER : UserEmailEventNameData = new UserEmailEventNameData("Product Sale Is Over");
    public static final ORDERPREPROCESSING : UserEmailEventNameData = new UserEmailEventNameData(OrderHistoryData.PREPROCESSING);
    public static final ORDERPROCESSING : UserEmailEventNameData = new UserEmailEventNameData(OrderHistoryData.PROCESSING);
    public static final ORDERCANCELLED : UserEmailEventNameData = new UserEmailEventNameData(OrderHistoryData.CANCELLED);
    public static final ORDERPARTIALLYSHIPPED : UserEmailEventNameData = new UserEmailEventNameData(OrderHistoryData.PARTIALLYSHIPPED);
    public static final ORDERSHIPPED : UserEmailEventNameData = new UserEmailEventNameData(OrderHistoryData.SHIPPED);
    public static final QUOTEREQUEST : UserEmailEventNameData = new UserEmailEventNameData("Quote Request");
    public static final NEWPASSWORD : UserEmailEventNameData = new UserEmailEventNameData("New Password");
    public function isEvent(userEmailEventNameString : String) : Bool {
        return UserEmailEventNameData.userNameEvenNameHashMap.containsKey(userEmailEventNameString);
    }

    // throws Exception
    // synchronized
    public static function getInstance(userEmailEventNameString : String) : UserEmailEventNameData {
        var userEmailEventNameData : UserEmailEventNameData = (cast UserEmailEventNameData.userNameEvenNameHashMap.get(userEmailEventNameString) : UserEmailEventNameData);
        if (userEmailEventNameData == null) {
            throw new haxe.Exception();
        } else {
            return userEmailEventNameData;
        }
    }

    public function toString() : String {
        return this.eventHandlerName;
    }

}

