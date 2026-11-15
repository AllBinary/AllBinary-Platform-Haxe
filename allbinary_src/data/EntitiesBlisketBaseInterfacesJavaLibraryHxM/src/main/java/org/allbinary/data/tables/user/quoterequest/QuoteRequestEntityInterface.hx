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
package org.allbinary.data.tables.user.quoterequest;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.quoterequest.QuoteRequest;
import org.allbinary.data.tables.BasicDataTableInterface;

interface QuoteRequestEntityInterface extends BasicDataTableInterface {
    // throws Exception
    function get(userName : String, id : Int) : QuoteRequest;

    function getIds(userName : String) : BasicArrayList;

    function deleteWhere(key : String, value : String) : Void;

    function insert(values : BasicArrayList) : Void;

    function update(userName : String, updatedValues : HashMap) : Void;

}

