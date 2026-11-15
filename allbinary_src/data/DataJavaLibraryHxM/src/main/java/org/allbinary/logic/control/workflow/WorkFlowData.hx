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
package org.allbinary.logic.control.workflow;


class WorkFlowData {
    private static final instance : WorkFlowData = new WorkFlowData();
    public static function getInstance() : WorkFlowData {
        return WorkFlowData.instance;
    }

    public function new() {
    }

    public var WORKFLOWS : String = "WORKFLOWS";
    public var WORKFLOW : String = "WORKFLOW";
    public var NAME : String = "WORKFLOW_NAME";
    public var DATA : String = "WORKFLOW_DATA";
}

