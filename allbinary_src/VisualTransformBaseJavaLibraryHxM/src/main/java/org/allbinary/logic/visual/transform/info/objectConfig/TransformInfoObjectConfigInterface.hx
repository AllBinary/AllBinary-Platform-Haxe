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
package org.allbinary.logic.visual.transform.info.objectConfig;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;

interface TransformInfoObjectConfigInterface extends DomDocumentMappingInterface {
    function containsView(transformInfoInterface : TransformInfoInterface) : Bool;

    // throws Exception
    function getName() : String;

    // throws Exception
    function getTransformsGroup(group : String) : BasicArrayList;

    // throws Exception
    function getTransforms() : BasicArrayList;

    // throws Exception
    function getParentTransforms() : BasicArrayList;

    // throws Exception
    function getGroupTransforms() : BasicArrayList;

    // throws Exception
    function getOutputTypeName() : String;

    function setOutputTypeName(value : String) : Void;

    // throws Exception
    function getInputOutputTypeName() : String;

    // throws Exception
    function getInputOutputTypeFile() : String;

    // throws Exception
    function getImportUriPath() : String;

    function toString() : String;

}

