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
package org.allbinary.logic.visual.transform.info;

//import java.util.HashMap;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface;
import org.w3c.dom.Document;

interface TransformInfoInterface extends TableMappingInterface {
    function log() : String;

    // throws Exception
    function override_(hashMap : HashMap) : Void;

    function getName() : String;

    function setStoreName(value : String) : Void;

    function getStoreName() : String;

    function getObjectFile() : String;

    function getObject() : Any;

    // throws Exception
    function getTemplateFilePath() : AbPath;

    function getTemplateFile() : String;

    function getTemplate() : String;

    // throws Exception
    function getDataFilePath() : AbPath;

    function getDataFile() : String;

    // throws Exception
    function getDataDocument() : Document;

    function setName(value : String) : Void;

    function setObjectFile(value : String) : Void;

    function setObject(anyType : Any) : Void;

    // throws Exception
    function setObjectConfigInterface(transformInfoObjectConfigInterface : TransformInfoObjectConfigInterface) : Void;

    // throws Exception
    function getObjectConfigInterface() : TransformInfoObjectConfigInterface;

    function setTemplateFile(value : String) : Void;

    function setTemplate(value : String) : Void;

    function setDataFile(value : String) : Void;

    function setData(value : String) : Void;

    function setChild() : Void;

    function isChild() : Bool;

}

