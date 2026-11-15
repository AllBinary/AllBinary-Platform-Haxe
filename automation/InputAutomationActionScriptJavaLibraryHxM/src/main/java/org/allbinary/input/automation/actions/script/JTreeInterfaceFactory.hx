/*
 * 
 * To change this license header, choose License Headers in Project Properties. 
 * To change this template file, choose Tools | Templates 
 * and open the template in the editor.  
 */
// Generated Code Do Not Modify
package org.allbinary.input.automation.actions.script;


class JTreeInterfaceFactory {
    private static final instance : JTreeInterfaceFactory = new JTreeInterfaceFactory();
    public static function getInstance() : JTreeInterfaceFactory {
        return JTreeInterfaceFactory.instance;
    }

    private var jTreeInterface : JTreeInterface = null;
    public function set(jTreeInterface : JTreeInterface) : Void {
        this.jTreeInterface = jTreeInterface;
    }

    public function getJTreeInterface() : JTreeInterface {
        return this.jTreeInterface;
    }

    public function new() {
    }
}

