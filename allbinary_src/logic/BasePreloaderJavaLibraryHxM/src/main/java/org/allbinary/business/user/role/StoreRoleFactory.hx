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

class StoreRoleFactory {
    private static final instance : StoreRoleFactory = new StoreRoleFactory();
    public static function getInstance() : StoreRoleFactory {
        return StoreRoleFactory.instance;
    }

    private final roles : BasicArrayList = new BasicArrayListD();
    private final subscriberRoles : BasicArrayList = new BasicArrayListD();
    private final wholesaleRoles : BasicArrayList = new BasicArrayListD();
    public function new() {
        final basicUserRoleFactory : BasicUserRoleFactory = BasicUserRoleFactory.getInstance();
        this.roles.add(basicUserRoleFactory.CUSTOMER);
        this.roles.add(basicUserRoleFactory.SUBSCRIBERCUSTOMER);
        this.roles.add(basicUserRoleFactory.WHOLESALECUSTOMER);
        this.subscriberRoles.add(basicUserRoleFactory.SUBSCRIBERCUSTOMER);
        this.wholesaleRoles.add(basicUserRoleFactory.WHOLESALECUSTOMER);
    }

    public function getRoles() : BasicArrayList {
        return this.roles;
    }

    public function getSubscriberRoles() : BasicArrayList {
        return this.subscriberRoles;
    }

    public function getWholesaleRoles() : BasicArrayList {
        return this.wholesaleRoles;
    }

}

