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
    public final INSTALLER : UserRole = new UserRoleB(this.basicUserRoleFactory.INSTALLER, null);
    public final ADMINISTRATOR : UserRole = new UserRoleB(this.basicUserRoleFactory.ADMINISTRATOR, new AdminUserFactory());
    public final CUSTOMER : UserRole = new UserRoleB(this.basicUserRoleFactory.CUSTOMER, new UserFactory());
    public final SUBSCRIBERCUSTOMER : UserRole = new UserRoleB(this.basicUserRoleFactory.SUBSCRIBERCUSTOMER, new SubscriberUserFactory());
    public final WHOLESALECUSTOMER : UserRole = new UserRoleB(this.basicUserRoleFactory.WHOLESALECUSTOMER, new WholesaleUserFactory());
    public final STOREMANAGER : UserRole = new UserRoleB(this.basicUserRoleFactory.STOREMANAGER, new StoreAdminUserFactory());
    public final PRODUCTMANAGER : UserRole = new UserRoleB(this.basicUserRoleFactory.PRODUCTMANAGER, new ProductStoreAdminUserFactory());
    public final CUSTOMERMANAGER : UserRole = new UserRoleB(this.basicUserRoleFactory.CUSTOMERMANAGER, new CustomerStoreAdminUserFactory());
    public final PAYMENTMANAGER : UserRole = new UserRoleB(this.basicUserRoleFactory.PAYMENTMANAGER, new PaymentStoreAdminUserFactory());
    public final ORDERMANAGER : UserRole = new UserRoleB(this.basicUserRoleFactory.ORDERMANAGER, new OrderStoreAdminUserFactory());
    public final WEBMANAGER : UserRole = new UserRoleB(this.basicUserRoleFactory.WEBMANAGER, new WebStoreAdminUserFactory());
    public final REVIEWER : UserRole = new UserRoleB(this.basicUserRoleFactory.REVIEWER, new ReviewOrderStoreAdminUserFactory());
    public final SHIPPING : UserRole = new UserRoleB(this.basicUserRoleFactory.SHIPPING, new ShipOrderStoreAdminUserFactory());
    public final ADJUSTER : UserRole = new UserRoleB(this.basicUserRoleFactory.ADJUSTER, new AdjustOrderStoreAdminUserFactory());
    public final WORKFLOWEDITOR : UserRole = new UserRoleB(this.basicUserRoleFactory.WORKFLOWEDITOR, new WorkflowEditorWebStoreAdminUserFactory());
    public final WIZARD : UserRole = new UserRoleB(this.basicUserRoleFactory.WIZARD, new WizardWebStoreAdminUserFactory());
    public final VIEWEDITOR : UserRole = new UserRoleB(this.basicUserRoleFactory.VIEWEDITOR, new ViewEditorWebStoreAdminUserFactory());
    public function new() {
    }
}

