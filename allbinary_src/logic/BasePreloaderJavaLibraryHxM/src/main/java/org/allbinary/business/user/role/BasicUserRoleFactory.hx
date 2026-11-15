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
    public final INSTALLER : BasicUserRole;
    public final ADMINISTRATOR : BasicUserRole;
    public final CUSTOMER : BasicUserRole;
    public final SUBSCRIBERCUSTOMER : BasicUserRole;
    public final WHOLESALECUSTOMER : BasicUserRole;
    public final STOREMANAGER : BasicUserRole;
    public final PRODUCTMANAGER : BasicUserRole;
    public final CUSTOMERMANAGER : BasicUserRole;
    public final PAYMENTMANAGER : BasicUserRole;
    public final ORDERMANAGER : BasicUserRole;
    public final WEBMANAGER : BasicUserRole;
    public final REVIEWER : BasicUserRole;
    public final SHIPPING : BasicUserRole;
    public final ADJUSTER : BasicUserRole;
    public final WORKFLOWEDITOR : BasicUserRole;
    public final WIZARD : BasicUserRole;
    public final VIEWEDITOR : BasicUserRole;
    public function new() {
        this.INSTALLER = new BasicUserRole("Installer", 16, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.ADMINISTRATOR = new BasicUserRole("Administrator", 0, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.CUSTOMER = new BasicUserRole("CustomerUser", "Customer User", 1, this.CUSTOMERTIMEOUT, this.CUSTOMERMAXSESSIONTIME);
        this.SUBSCRIBERCUSTOMER = new BasicUserRole("SubscriberUser", "Subscriber User", 2, this.CUSTOMERTIMEOUT, this.CUSTOMERMAXSESSIONTIME);
        this.WHOLESALECUSTOMER = new BasicUserRole("WholesaleUser", "Wholesale User", 3, this.CUSTOMERTIMEOUT, this.CUSTOMERMAXSESSIONTIME);
        this.STOREMANAGER = new BasicUserRole("StoreManager", "Store Manager", 4, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.PRODUCTMANAGER = new BasicUserRole("ProductManager", "Product Manager", 5, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.CUSTOMERMANAGER = new BasicUserRole("UserManager", "User Manager", 6, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.PAYMENTMANAGER = new BasicUserRole("PaymentManager", "Payment Manager", 7, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.ORDERMANAGER = new BasicUserRole("OrderManager", "Order Manager", 8, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.WEBMANAGER = new BasicUserRole("WebManager", "Web Manager", 9, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.REVIEWER = new BasicUserRole("Reviewer", 10, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.SHIPPING = new BasicUserRole("Shipping", 11, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.ADJUSTER = new BasicUserRole("Adjuster", 12, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.WORKFLOWEDITOR = new BasicUserRole("WorkFlowEditor", "WorkFlow Editor", 13, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.WIZARD = new BasicUserRole("WizardUser", "Wizard User", 14, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
        this.VIEWEDITOR = new BasicUserRole("ViewEditor", "View Editor", 15, this.MAXSESSIONTIME, this.INACTIVITYTIMEOUT);
    }
}

