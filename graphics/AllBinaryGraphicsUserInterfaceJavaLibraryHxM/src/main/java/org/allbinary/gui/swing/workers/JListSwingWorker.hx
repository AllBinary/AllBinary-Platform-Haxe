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
package org.allbinary.gui.swing.workers;

//import javax.swing.*;

class JListSwingWorker extends SwingWorker {
    private var jList : JList = null;
    private var listModel : ListModel = null;
    public function new(jList : JList, listModel : ListModel) {
        super();
        this.setJList(jList);
        this.setListModel(listModel);
    }

    public function doInBackground() : Any {
        return null;
    }

    public function done() : Void {
        this.getJList().setModel(this.getListModel());
    }

    private function getJList() : JList {
        return this.jList;
    }

    private function setJList(jList : JList) : Void {
        this.jList = jList;
    }

    private function getListModel() : ListModel {
        return this.listModel;
    }

    private function setListModel(listModel : ListModel) : Void {
        this.listModel = listModel;
    }

}

