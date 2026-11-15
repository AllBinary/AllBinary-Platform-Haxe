/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.input;

import org.allbinary.logic.util.visitor.Visitor;

class SelectAdvancedRTSLayerVisitorFactory implements SelectRTSLayerVisitorFactoryInterface {
    private static final instance : SelectAdvancedRTSLayerVisitorFactory = new SelectAdvancedRTSLayerVisitorFactory();
    public static function getInstance() : SelectAdvancedRTSLayerVisitorFactory {
        return SelectAdvancedRTSLayerVisitorFactory.instance;
    }

    public function new() {
    }

    public function create(selectedRTSLayersPlayerGameInput : SelectedRTSLayersPlayerGameInput) : Visitor {
        return new SelectAdvancedRTSLayerVisitor(selectedRTSLayersPlayerGameInput);
    }

}

