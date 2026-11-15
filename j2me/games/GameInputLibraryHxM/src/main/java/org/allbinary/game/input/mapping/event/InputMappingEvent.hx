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
package org.allbinary.game.input.mapping.event;

import org.allbinary.game.input.mapping.InputToGameKeyMapping;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class InputMappingEvent extends AllBinaryEventObject {
    private var inputToGameKeyMapping : InputToGameKeyMapping = InputToGameKeyMapping.getNullInstance();
    public function new(anyType : Any) {
        super(anyType);
    }

    public function setInputToGameKeyMapping(inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        this.inputToGameKeyMapping = inputToGameKeyMapping;
    }

    public function getInputToGameKeyMapping() : InputToGameKeyMapping {
        return this.inputToGameKeyMapping;
    }

}

