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
package org.allbinary.game.resource;

import org.allbinary.game.configuration.feature.GameFeatureControlledInterface;
import org.allbinary.graphics.RelativeRelationship;
import org.allbinary.util.BasicArrayList;

interface ResourceRelativeRelationshipFactoryInterface extends GameFeatureControlledInterface {
    // throws Exception
    function getResourceRelativeRelationshipList(resource : String) : BasicArrayList;

    // throws Exception
    function addResourceRelativeRelationship(resource : String, relativeRelationship : RelativeRelationship) : Void;

}

