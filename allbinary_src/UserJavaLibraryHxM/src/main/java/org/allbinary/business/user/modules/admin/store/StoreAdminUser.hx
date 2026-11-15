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
package org.allbinary.business.user.modules.admin.store;

//import java.util.HashMap;
import org.allbinary.business.user.modules.User;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface;

class StoreAdminUser extends User {
    public function new() {
        super();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(userHashMap : HashMap) {
        super(userHashMap);
    }

    public function validateSession(weblisketSession : WeblisketSessionInterface) : Void {
        super.validateSession(weblisketSession);
        this.updateSession(weblisketSession);
    }

    public function updateSession(weblisketSession : WeblisketSessionInterface) : Void {
        weblisketSession.setStoreName(this.getPermissions());
    }

}

