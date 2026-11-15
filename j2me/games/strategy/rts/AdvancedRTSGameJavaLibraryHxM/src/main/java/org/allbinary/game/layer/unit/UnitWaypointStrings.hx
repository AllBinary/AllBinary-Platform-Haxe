/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.game.layer.unit;

import org.allbinary.string.CommonLabels;

class UnitWaypointStrings {
    private static final instance : UnitWaypointStrings = new UnitWaypointStrings();
    public static function getInstance() : UnitWaypointStrings {
        return UnitWaypointStrings.instance;
    }

    public final WANDERING : String = "Order?";
    public final THINKING : String = "Thinking";
    public final THINKING_ABOUT_TARGET : String = "Hmmm";
    public final TARGET : String = "Target";
    public final KILL : String = "Kill!";
    public final STOP : String = "Stop";
    public final WAYPOINT_DESTROYED_SHORT : String = "Uh Oh";
    public final WAYPOINT_DESTROYED : String = "Waypoint Destroyed";
    public final ALL_VISITED_SHORT : String = "Arrived";
    public final ALL_VISITED : String = "All Visited";
    public final ALREADY_THERE_SHORT : String = "Again?";
    public final ALREADY_THERE : String = "Already There";
    public final NEXT_PATH_NODE : String = CommonLabels.getInstance().NEXT + " Path Node";
    public function new() {
    }
}

