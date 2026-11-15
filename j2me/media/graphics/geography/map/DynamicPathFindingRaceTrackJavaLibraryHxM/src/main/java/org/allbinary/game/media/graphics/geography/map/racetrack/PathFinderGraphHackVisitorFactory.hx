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
package org.allbinary.game.media.graphics.geography.map.racetrack;

import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorFactoryBase;
import org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorBase;

class PathFinderGraphHackVisitorFactory extends PathFinderGraphVisitorFactoryBase {
    private final edgeMinimum : Int;
    private final minPathWeight : Int;
    private final maxPathWeight : Int;
    public function new(edgeMinimum : Int, minPathWeight : Int, maxPathWeight : Int) {
        super();
        this.edgeMinimum = edgeMinimum;
        this.minPathWeight = minPathWeight;
        this.maxPathWeight = maxPathWeight;
    }

    public function getInstance(geographicMapInterface : BasicGeographicMap) : PathFinderGraphVisitorBase {
        return new PathFinderGraphHackVisitor(geographicMapInterface, this.edgeMinimum, this.minPathWeight, this.maxPathWeight);
    }

}

