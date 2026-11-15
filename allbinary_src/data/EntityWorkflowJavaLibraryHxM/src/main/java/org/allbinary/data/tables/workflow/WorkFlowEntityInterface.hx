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
package org.allbinary.data.tables.workflow;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.BasicDataTableInterface;
import org.allbinary.logic.control.workflow.WorkFlowInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;

interface WorkFlowEntityInterface extends BasicDataTableInterface {
    function get(storeName : String) : BasicArrayList;

    // throws Exception, LicensingException
    function get(name : String, storeName : String) : WorkFlowInterface;

    function delete(name : String, storeName : String) : Void;

    function insert(values : BasicArrayList) : Void;

    function update(updatedValues : HashMap) : Void;

}

