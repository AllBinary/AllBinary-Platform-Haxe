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

import org.allbinary.business.user.modules.UserFactory;
import org.allbinary.business.user.modules.admin.AdminUserFactory;
import org.allbinary.business.user.modules.admin.store.StoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.customer.CustomerStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.order.OrderStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.order.adjust.AdjustOrderStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.order.review.ReviewOrderStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.order.ship.ShipOrderStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.payment.PaymentStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.product.ProductStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.web.WebStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.web.view.editor.ViewEditorWebStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.web.wizard.WizardWebStoreAdminUserFactory;
import org.allbinary.business.user.modules.admin.store.web.workflow.editor.WorkflowEditorWebStoreAdminUserFactory;
import org.allbinary.business.user.modules.customer.subscriber.SubscriberUserFactory;
import org.allbinary.business.user.modules.customer.wholesale.WholesaleUserFactory;

class UserRoleFactory {
    private static final instance : UserRoleFactory = new UserRoleFactory();
    public static function getInstance() : UserRoleFactory {
        return UserRoleFactory.instance;
    }

    private final basicUserRoleFactory : BasicUserRoleFactory = BasicUserRoleFactory.getInstance();
    public final INSTALLER : UserRole;
    public final ADMINISTRATOR : UserRole;
    public final CUSTOMER : UserRole;
    public final SUBSCRIBERCUSTOMER : UserRole;
    public final WHOLESALECUSTOMER : UserRole;
    public final STOREMANAGER : UserRole;
    public final PRODUCTMANAGER : UserRole;
    public final CUSTOMERMANAGER : UserRole;
    public final PAYMENTMANAGER : UserRole;
    public final ORDERMANAGER : UserRole;
    public final WEBMANAGER : UserRole;
    public final REVIEWER : UserRole;
    public final SHIPPING : UserRole;
    public final ADJUSTER : UserRole;
    public final WORKFLOWEDITOR : UserRole;
    public final WIZARD : UserRole;
    public final VIEWEDITOR : UserRole;
    public function new() {
        this.INSTALLER = new UserRoleB(this.basicUserRoleFactory.INSTALLER, null);
        this.ADMINISTRATOR = new UserRoleB(this.basicUserRoleFactory.ADMINISTRATOR, new AdminUserFactory());
        this.CUSTOMER = new UserRoleB(this.basicUserRoleFactory.CUSTOMER, new UserFactory());
        this.SUBSCRIBERCUSTOMER = new UserRoleB(this.basicUserRoleFactory.SUBSCRIBERCUSTOMER, new SubscriberUserFactory());
        this.WHOLESALECUSTOMER = new UserRoleB(this.basicUserRoleFactory.WHOLESALECUSTOMER, new WholesaleUserFactory());
        this.STOREMANAGER = new UserRoleB(this.basicUserRoleFactory.STOREMANAGER, new StoreAdminUserFactory());
        this.PRODUCTMANAGER = new UserRoleB(this.basicUserRoleFactory.PRODUCTMANAGER, new ProductStoreAdminUserFactory());
        this.CUSTOMERMANAGER = new UserRoleB(this.basicUserRoleFactory.CUSTOMERMANAGER, new CustomerStoreAdminUserFactory());
        this.PAYMENTMANAGER = new UserRoleB(this.basicUserRoleFactory.PAYMENTMANAGER, new PaymentStoreAdminUserFactory());
        this.ORDERMANAGER = new UserRoleB(this.basicUserRoleFactory.ORDERMANAGER, new OrderStoreAdminUserFactory());
        this.WEBMANAGER = new UserRoleB(this.basicUserRoleFactory.WEBMANAGER, new WebStoreAdminUserFactory());
        this.REVIEWER = new UserRoleB(this.basicUserRoleFactory.REVIEWER, new ReviewOrderStoreAdminUserFactory());
        this.SHIPPING = new UserRoleB(this.basicUserRoleFactory.SHIPPING, new ShipOrderStoreAdminUserFactory());
        this.ADJUSTER = new UserRoleB(this.basicUserRoleFactory.ADJUSTER, new AdjustOrderStoreAdminUserFactory());
        this.WORKFLOWEDITOR = new UserRoleB(this.basicUserRoleFactory.WORKFLOWEDITOR, new WorkflowEditorWebStoreAdminUserFactory());
        this.WIZARD = new UserRoleB(this.basicUserRoleFactory.WIZARD, new WizardWebStoreAdminUserFactory());
        this.VIEWEDITOR = new UserRoleB(this.basicUserRoleFactory.VIEWEDITOR, new ViewEditorWebStoreAdminUserFactory());
    }
}

