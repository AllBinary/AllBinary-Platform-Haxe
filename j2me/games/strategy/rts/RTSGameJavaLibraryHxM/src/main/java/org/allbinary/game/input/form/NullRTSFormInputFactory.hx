/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.input.form;

import org.allbinary.game.identification.BasicGroupFactory;

class NullRTSFormInputFactory {
    private static final SINGLETON : RTSFormInput = new RTSFormInput(BasicGroupFactory.getInstance().NONE_ARRAY);
    public static function getInstance() : RTSFormInput {
        return NullRTSFormInputFactory.SINGLETON;
    }

    public function new() {
    }
}

