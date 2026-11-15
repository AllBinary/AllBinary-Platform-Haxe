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
package org.allbinary.business.user.modules.admin;

//import java.util.HashMap;
import org.allbinary.business.user.UserFactoryInterface;
import org.allbinary.business.user.UserInterface;

class AdminUserFactory implements UserFactoryInterface {
    public function new() {
    }

    // throws Exception
    public function getInstance() : UserInterface {
        return new AdminUser();
    }

    // throws Exception
    public function getInstance(hashMap : HashMap) : UserInterface {
        return new AdminUser(hashMap);
    }

}

