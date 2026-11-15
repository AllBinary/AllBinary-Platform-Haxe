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


class StoreFrontUsersStatisticsData {
    private static final instance : StoreFrontUsersStatisticsData = new StoreFrontUsersStatisticsData();
    public function new() {
    }

    public static function getInstance() : StoreFrontUsersStatisticsData {
        return StoreFrontUsersStatisticsData.instance;
    }

    public final NAME : String = "STOREFRONT_USERS_STATISTICS_NAME";
    public final NUMBEROFUSERS : String = "STOREFRONT_USERS_STATISTICS_NUMBER_OF_USERS";
}

