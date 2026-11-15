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
package org.allbinary.input.automation.module;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.swing.*;
import org.allbinary.logic.StdUtil;

class DefaultListModelHelper {
    private var defaultListModel : DefaultListModel;
    private var vector : BasicArrayList;
    public function new() {
        this.vector = new BasicArrayListD();
        this.defaultListModel = new DefaultListModel();
    }

    public function initDefaultModelList() : Void {
        this.defaultListModel = new DefaultListModel();
        final size : Int = this.vector.size();
        for (index in 0...size) {
            var moduleName : String = (cast this.vector.get(index) : String);
            this.defaultListModel.addElement(moduleName);
        }
    }

    public function getListModel() : ListModel {
        return (cast this.defaultListModel : ListModel);
    }

    public function add(string : String) : Void {
        this.vector.add(string);
    }

    public function remove(string : String) : Void {
        this.vector.remove(string);
    }

}

