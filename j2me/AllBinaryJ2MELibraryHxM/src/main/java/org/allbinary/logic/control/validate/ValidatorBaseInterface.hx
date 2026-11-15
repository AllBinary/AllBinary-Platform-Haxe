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
package org.allbinary.logic.control.validate;

import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;

interface ValidatorBaseInterface {
    function isValid() : Null<Bool>;

    function validationInfo() : String;

    function toHashtable() : ABHashtable<Any, Any>;

    function toList() : BasicArrayList;

}

