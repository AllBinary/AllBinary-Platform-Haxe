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
package org.allbinary.game.ag.life;


class Life implements LifeInterface {
    public static function createLife() : Life {
        try {
            return new Life(0, 0);
        } catch (e : haxe.Exception) {
            throw new haxe.Exception();
        }
    }

    public static final NO_LIFE : Life = Life.createLife();
    private var lives : Int;
    private var startLives : Int;
    private var maxlives : Int;
    public function new(lives : Int, maxlives : Int) {
        this.maxlives = maxlives;
        if (lives > this.maxlives) {
            throw new haxe.Exception("To Many Lives");
        }
        this.lives = lives;
        this.startLives = lives;
    }

    public function get() : Int {
        return this.lives;
    }

    public function set(lives : Int) : Void {
        this.lives = lives;
    }

    public function reset() : Void {
        this.lives = this.startLives;
    }

    public function add(lives : Int) : Void {
        if (!this.reachedLimit()) {
            if (this.lives + lives <= this.getMaxlives()) {
                this.lives = (this.lives + lives);
            } else {
                this.lives = this.getMaxlives();
            }
        }
    }

    public function isAlive() : Bool {
        if (this.lives <= 0) {
            return false;
        } else {
            return true;
        }
    }

    public function getMaxlives() : Int {
        return this.maxlives;
    }

    private function reachedLimit() : Bool {
        if (this.lives > this.maxlives || this.lives < 0) {
            return true;
        } else {
            return false;
        }
    }

    public function deaths(lives : Int) : Void {
        if (!this.reachedLimit()) {
            if (this.lives - lives >= 0) {
                this.lives = (this.lives - lives);
            } else {
                this.lives = 0;
            }
        }
    }

    public function getStartLives() : Int {
        return this.startLives;
    }

    public function setStartLives(startLives : Int) : Void {
        this.startLives = startLives;
    }

}

