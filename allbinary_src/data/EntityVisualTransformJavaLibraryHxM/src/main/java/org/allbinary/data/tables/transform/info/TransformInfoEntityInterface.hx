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
package org.allbinary.data.tables.transform.info;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.jsp.PageContext;
import org.allbinary.data.tables.BasicDataTableInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;

interface TransformInfoEntityInterface extends BasicDataTableInterface {
    // throws Exception
    function get(name : String, propertiesHashMap : HashMap, pageContext : PageContext) : TransformInfoInterface;

    // throws Exception
    function getObjectConfigs(storeName : String) : BasicArrayList;

    // throws Exception
    function getNames(storeName : String) : BasicArrayList;

    function delete(name : String) : Void;

    function insert(values : BasicArrayList) : Void;

    function update(updatedValues : HashMap) : Void;

}

