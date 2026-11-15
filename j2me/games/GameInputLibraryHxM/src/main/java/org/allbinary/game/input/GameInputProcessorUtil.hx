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
package org.allbinary.game.input;


class GameInputProcessorUtil {
    public static function init(inputProcessorArray : haxe.ds.Vector<GameInputProcessor>) : Void {
        final noInputProcessor : GameInputProcessor = GameInputProcessor.getInstance();
        final total : Int = InputFactory.getInstance().MAX;
        for (index in 0...total) {
            var inputProcessorCanBeNull : GameInputProcessor = inputProcessorArray[index];
            if (inputProcessorCanBeNull == null) {
                inputProcessorArray[index] = noInputProcessor;
            }
        }
    }

    public function new() {
    }
}

