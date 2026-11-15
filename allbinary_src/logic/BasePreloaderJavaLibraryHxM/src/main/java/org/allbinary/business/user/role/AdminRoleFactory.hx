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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AdminRoleFactory {
    private static final instance : AdminRoleFactory = new AdminRoleFactory();
    public static function getInstance() : AdminRoleFactory {
        return AdminRoleFactory.instance;
    }

    private final adminRoles : BasicArrayList = new BasicArrayListD();
    private final storeAdminRoles : BasicArrayList = new BasicArrayListD();
    private final storeManagementRoles : BasicArrayList = new BasicArrayListD();
    private final productManagementRoles : BasicArrayList = new BasicArrayListD();
    private final reviewManagementRoles : BasicArrayList = new BasicArrayListD();
    private final customerManagementRoles : BasicArrayList = new BasicArrayListD();
    private final workflowManagementRoles : BasicArrayList = new BasicArrayListD();
    private final orderManagementRoles : BasicArrayList = new BasicArrayListD();
    private final adjusterManagementRoles : BasicArrayList = new BasicArrayListD();
    private final shippingManagementRoles : BasicArrayList = new BasicArrayListD();
    private final webManagementRoles : BasicArrayList = new BasicArrayListD();
    public function new() {
        final basicUserRoleFactory : BasicUserRoleFactory = BasicUserRoleFactory.getInstance();
        this.adminRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.storeAdminRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.storeAdminRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.storeManagementRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.storeManagementRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.storeManagementRoles.add(basicUserRoleFactory.CUSTOMERMANAGER);
        this.storeManagementRoles.add(basicUserRoleFactory.ADJUSTER);
        this.storeManagementRoles.add(basicUserRoleFactory.PRODUCTMANAGER);
        this.storeManagementRoles.add(basicUserRoleFactory.REVIEWER);
        this.storeManagementRoles.add(basicUserRoleFactory.SHIPPING);
        this.productManagementRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.productManagementRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.productManagementRoles.add(basicUserRoleFactory.PRODUCTMANAGER);
        this.reviewManagementRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.reviewManagementRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.reviewManagementRoles.add(basicUserRoleFactory.REVIEWER);
        this.customerManagementRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.customerManagementRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.customerManagementRoles.add(basicUserRoleFactory.CUSTOMERMANAGER);
        this.workflowManagementRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.workflowManagementRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.workflowManagementRoles.add(basicUserRoleFactory.WORKFLOWEDITOR);
        this.orderManagementRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.orderManagementRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.adjusterManagementRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.adjusterManagementRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.adjusterManagementRoles.add(basicUserRoleFactory.ADJUSTER);
        this.shippingManagementRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.shippingManagementRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.shippingManagementRoles.add(basicUserRoleFactory.SHIPPING);
        this.webManagementRoles.add(basicUserRoleFactory.ADMINISTRATOR);
        this.webManagementRoles.add(basicUserRoleFactory.STOREMANAGER);
        this.webManagementRoles.add(basicUserRoleFactory.WEBMANAGER);
        this.webManagementRoles.add(basicUserRoleFactory.WORKFLOWEDITOR);
        this.webManagementRoles.add(basicUserRoleFactory.VIEWEDITOR);
    }

    public function getProductManagementRoles() : BasicArrayList {
        return this.productManagementRoles;
    }

    public function getAdminRoles() : BasicArrayList {
        return this.adminRoles;
    }

    public function getStoreAdminRoles() : BasicArrayList {
        return this.storeAdminRoles;
    }

    public function getStoreManagementRoles() : BasicArrayList {
        return this.storeManagementRoles;
    }

    public function getReviewManagementRoles() : BasicArrayList {
        return this.reviewManagementRoles;
    }

    public function getCustomerManagementRoles() : BasicArrayList {
        return this.customerManagementRoles;
    }

    public function getWorkflowManagementRoles() : BasicArrayList {
        return this.workflowManagementRoles;
    }

    public function getWebManagementRoles() : BasicArrayList {
        return this.webManagementRoles;
    }

    public function getShippingManagementRoles() : BasicArrayList {
        return this.shippingManagementRoles;
    }

    public function getAdjusterManagementRoles() : BasicArrayList {
        return this.adjusterManagementRoles;
    }

    public function getOrderManagementRoles() : BasicArrayList {
        return this.orderManagementRoles;
    }

}

