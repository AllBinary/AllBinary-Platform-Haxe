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
package org.allbinary.input.automation.module.generic.configuration.profile;

import org.w3c.dom.Document;
import org.w3c.dom.Node;

interface GenericProfileDataWorkerTypeInterface {
    function getName() : String;

    function setName(name : String) : Void;

    function toString() : String;

    // throws Exception
    function toXmlNode(document : Document) : Node;

}

