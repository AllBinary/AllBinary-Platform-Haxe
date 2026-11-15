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
package org.allbinary.game.layer;

import org.allbinary.logic.math.SmallIntegerSingletonFactory;

class Aggression {
    private var ram : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(0);
    private var projectile : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(0);
    private var drops : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(0);
    public function new(ram : Null<Int>, projectile : Null<Int>, drops : Null<Int>) {
        this.setRam(ram);
        this.setProjectile(projectile);
        this.setDrops(drops);
    }

    public function getRam() : Null<Int> {
        return this.ram;
    }

    public function setRam(ram : Null<Int>) : Void {
        this.ram = ram;
    }

    public function getProjectile() : Null<Int> {
        return this.projectile;
    }

    public function setProjectile(projectile : Null<Int>) : Void {
        this.projectile = projectile;
    }

    public function getDrops() : Null<Int> {
        return this.drops;
    }

    public function setDrops(drops : Null<Int>) : Void {
        this.drops = drops;
    }

}

