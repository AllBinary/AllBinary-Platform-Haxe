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
package org.allbinary.business.context.modules.storefront.statistics.users;

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.UserInterface;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.data.tables.user.UserEntityFactory;
import org.allbinary.data.tables.user.UserEntityInterface;
import org.allbinary.logic.StdUtil;

class StoreFrontUsersStatistics implements StoreFrontUsersStatisticsInterface {
    private var totalNumberOfUsers : Null<haxe.Int64>;
    private var totalUsersByRoleHashMap : HashMap;
    public function new(storeFrontInterface : StoreFrontInterface) {
        this.totalUsersByRoleHashMap = StdUtil.getInstance().createHashMap();
        final userEntityInterface : UserEntityInterface = UserEntityFactory.getInstance();
        final userVector : BasicArrayList = userEntityInterface.getCustomers();
        this.totalNumberOfUsers = userVector.size();
        final size : Int = userVector.size();
        for (index in 0...size) {
            var userInterface : UserInterface = (cast userVector.get(index) : UserInterface);
            var nextUserRole : UserRole = userInterface.getRole();
            var currentNumberOfUsersForRole : Null<haxe.Int64> = this.getNewTotal(nextUserRole);
            this.totalUsersByRoleHashMap.put(nextUserRole, currentNumberOfUsersForRole);
        }
    }

    private function getNewTotal(userRole : UserRole) : Null<haxe.Int64> {
        var numberOfUsersForRoleLong : Null<haxe.Int64> = (cast this.totalUsersByRoleHashMap.get(userRole) : Null<haxe.Int64>);
        if (numberOfUsersForRoleLong == null) {
            numberOfUsersForRoleLong = 0;
        }
        return haxe.Int64.ofInt(numberOfUsersForRoleLong) + 1;
    }

    public function getNumberOfUsers() : Null<haxe.Int64> {
        return this.totalNumberOfUsers;
    }

    public function getNumberOfUsersByRole(role : String) : Null<haxe.Int64> {
        var totalForRole : Null<haxe.Int64> = (cast this.totalUsersByRoleHashMap.get(role) : Null<haxe.Int64>);
        return totalForRole;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(StoreFrontUsersStatisticsData.getInstance().NUMBEROFUSERS, this.getNumberOfUsers().toString());
        var setOfUserRoles : Set = this.totalUsersByRoleHashMap.keySet();
        var nextUserRole : UserRole = null;
        final userRoleArray : haxe.ds.Vector<Any> = setOfUserRoles.toArray();
        final size : Int = userRoleArray.length;
        for (index in 0...size) {
            nextUserRole = (cast userRoleArray[index] : UserRole);
            var totalForRole : Null<haxe.Int64> = (cast this.totalUsersByRoleHashMap.get(nextUserRole) : Null<haxe.Int64>);
            hashMap.put(nextUserRole.toString(), totalForRole.toString());
        }
        return hashMap;
    }

    public function toVector() : BasicArrayList {
        return null;
    }

    public function getKey() : Any {
        return null;
    }

}

