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
package org.allbinary.logic.visual.transform.info;


class TransformInfoProperties {
    private var name : String;
    private var label : String;
    private var description : String;
    private var objectFileName : String;
    private var objectConfigFileName : String;
    private var templateFileName : String;
    public function new(name : String, label : String, description : String, objectFileName : String, objectConfigFileName : String, templateFileName : String) {
        this.name = name;
        this.label = label;
        this.description = description;
        this.objectFileName = objectFileName;
        this.templateFileName = templateFileName;
        this.objectConfigFileName = objectConfigFileName;
    }

    public function setName(value : String) : Void {
        this.name = value;
    }

    public function setDescription(value : String) : Void {
        this.description = value;
    }

    public function setViewFile(value : String) : Void {
        this.objectFileName = value;
    }

    public function setTemplateFile(value : String) : Void {
        this.templateFileName = value;
    }

    public function setObjectConfigFile(value : String) : Void {
        this.objectConfigFileName = value;
    }

    public function getName() : String {
        return this.name;
    }

    public function getLabel() : String {
        return this.label;
    }

    public function getDescription() : String {
        return this.description;
    }

    public function getViewFile() : String {
        return this.objectFileName;
    }

    public function getTemplateFile() : String {
        return this.templateFileName;
    }

    public function getObjectConfigFile() : String {
        return this.objectConfigFileName;
    }

}

