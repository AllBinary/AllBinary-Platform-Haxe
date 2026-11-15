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
package org.allbinary.physics.movement;


class NoMovementFactory {
    private static final instance : NoMovementFactory = new NoMovementFactory();
    public static function getInstance() : NoMovementFactory {
        return NoMovementFactory.instance;
    }

    private final movement : Movement = new Movement();
    public function getMovmentInstance() : Movement {
        return this.movement;
    }

    public function new() {
    }
}

