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
package org.allbinary.logic.visual.transform;

import org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface;
import org.allbinary.logic.visual.transform.data.TransformDocumentInterface;
import org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface;

interface TransformInterface extends DomDocumentMappingInterface extends CompositeTransformInfoInterface {
    function getTypeId() : Int;

    function setTransformDocumentInterface(viewDocumentInterface : TransformDocumentInterface) : Void;

    function getTransformDocumentInterface() : TransformDocumentInterface;

    // throws Exception
    function view() : String;

}

