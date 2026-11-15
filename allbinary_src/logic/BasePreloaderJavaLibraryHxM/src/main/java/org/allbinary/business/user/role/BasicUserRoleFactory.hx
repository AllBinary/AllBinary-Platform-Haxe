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
package org.allbinary.business.user.role;


class BasicUserRoleFactory {
    private static final instance : BasicUserRoleFactory = new BasicUserRoleFactory();
    public static function getInstance() : BasicUserRoleFactory {
        return BasicUserRoleFactory.instance;
    }

    private final INACTIVITYTIMEOUT : haxe.Int64 = 360000000;
    private final CUSTOMERTIMEOUT : haxe.Int64 = 360000000;
    private final CUSTOMERMAXSESSIONTIME : haxe.Int64 = 360000000;
    private final MAXSESSIONTIME : haxe.Int64 = 360000000;
    public final INSTALLER : BasicUserRole = new BasicUserRole("Installer", 16, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final ADMINISTRATOR : BasicUserRole = new BasicUserRole("Administrator", 0, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final CUSTOMER : BasicUserRole = new BasicUserRole("CustomerUser", "Customer User", 1, this.CUSTOMERTIMEOUT, this.CUSTOMERMAXSESSIONTIME);
    public final SUBSCRIBERCUSTOMER : BasicUserRole = new BasicUserRole("SubscriberUser", "Subscriber User", 2, this.CUSTOMERTIMEOUT, this.CUSTOMERMAXSESSIONTIME);
    public final WHOLESALECUSTOMER : BasicUserRole = new BasicUserRole("WholesaleUser", "Wholesale User", 3, this.CUSTOMERTIMEOUT, this.CUSTOMERMAXSESSIONTIME);
    public final STOREMANAGER : BasicUserRole = new BasicUserRole("StoreManager", "Store Manager", 4, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final PRODUCTMANAGER : BasicUserRole = new BasicUserRole("ProductManager", "Product Manager", 5, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final CUSTOMERMANAGER : BasicUserRole = new BasicUserRole("UserManager", "User Manager", 6, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final PAYMENTMANAGER : BasicUserRole = new BasicUserRole("PaymentManager", "Payment Manager", 7, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final ORDERMANAGER : BasicUserRole = new BasicUserRole("OrderManager", "Order Manager", 8, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final WEBMANAGER : BasicUserRole = new BasicUserRole("WebManager", "Web Manager", 9, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final REVIEWER : BasicUserRole = new BasicUserRole("Reviewer", 10, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final SHIPPING : BasicUserRole = new BasicUserRole("Shipping", 11, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final ADJUSTER : BasicUserRole = new BasicUserRole("Adjuster", 12, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final WORKFLOWEDITOR : BasicUserRole = new BasicUserRole("WorkFlowEditor", "WorkFlow Editor", 13, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final WIZARD : BasicUserRole = new BasicUserRole("WizardUser", "Wizard User", 14, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public final VIEWEDITOR : BasicUserRole = new BasicUserRole("ViewEditor", "View Editor", 15, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    public function new() {
    }
}

