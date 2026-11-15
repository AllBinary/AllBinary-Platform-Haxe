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
package org.allbinary.game.input.mapping;

//import java.util.Enumeration;
import org.allbinary.game.configuration.persistance.GamePersistanceStrings;
import org.allbinary.game.input.Input;
import org.allbinary.game.input.InputPersistance;
import org.allbinary.game.input.mapping.event.InputMappingEvent;
import org.allbinary.game.input.mapping.event.InputMappingEventListenerInterface;
import org.allbinary.game.input.mapping.event.NullInputMappingEventListener;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.EnumerationUtil;
import org.allbinary.util.ABHashtable;

//GameInputNoPersistanceLibrary
class PersistentInputMapping {
    public static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullInstance() : PersistentInputMapping {
        if (PersistentInputMapping.instance == NullUtil.getInstance().NULL_OBJECT) {
            PersistentInputMapping.instance = new PersistentInputMapping(GamePersistanceStrings.getInstance().SAVED_INPUT_CONFIGURATION_RECORD_ID);
        }
        return (cast PersistentInputMapping.instance : PersistentInputMapping);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final enumerationUtil : EnumerationUtil = EnumerationUtil.getInstance();
    private final inputMapping : InputToGameKeyMapping = new InputToGameKeyMapping();
    private var inputMappingEventListenerInterface : InputMappingEventListenerInterface = NullInputMappingEventListener.NULL_INPUT_MAPPING_EVENT_LISTENER;
    private final inputPersistance : InputPersistance;
    public function new(name : String) {
        this.inputPersistance = new InputPersistance(name);
    }

    public function getTotalMapped() : Int {
        return this.getInputMapping().getHashtable().size();
    }

    public function isDefaultNew() : Bool {
        return false;
    }

    public function getDefault() : InputToGameKeyMapping {
        return InputToGameKeyMapping.getNullInstance();
    }

    // throws Exception
    public function setDefault(abeClientInformation : AbeClientInformationInterface) : Void {
        this.getInputMapping().removeAll();
        this.getInputMapping().addMapping(this.getDefault());
        this.save(abeClientInformation);
    }

    // throws Exception
    public function update(abeClientInformation : AbeClientInformationInterface) : Void {
        this.inputPersistance.deleteAll(abeClientInformation);
        this.save(abeClientInformation);
    }

    private var inputMappingEvent : InputMappingEvent = new InputMappingEvent(this);
    // throws Exception
    public function save(abeClientInformation : AbeClientInformationInterface) : Void {
        this.inputPersistance.save(abeClientInformation, this.getInputMapping().getHashtable());
        this.inputMappingEvent.setInputToGameKeyMapping(this.getInputMapping());
        if (this.getInputMappingEventListenerInterface() != null) {
            this.getInputMappingEventListenerInterface().onInputMappingEvent(this.inputMappingEvent);
        }
    }

    // throws Exception
    public function init(abeClientInformation : AbeClientInformationInterface) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.INIT);
        try {
            this.inputPersistance.loadAll(abeClientInformation);
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
            this.inputPersistance.deleteRecoreStore(abeClientInformation);
            this.setDefault(abeClientInformation);
            this.inputPersistance.loadAll(abeClientInformation);
        }
        final list : BasicArrayList = this.inputPersistance.getList();
        var totalMappedTo : Int = 0;
        final size : Int = list.size();
        var hashtable : ABHashtable<Any, Any> = null;
        var enumeration : Enumeration = null;
        var mappedToInput : Input = null;
        var gameActionInput : Input = null;
        for (index in 0...size) {
            hashtable = (cast list.objectArray[index] : ABHashtable<Any, Any>);
            enumeration = hashtable.keys();
            while (this.enumerationUtil.hasMoreElements(enumeration)) {
                mappedToInput = (cast this.enumerationUtil.nextElement(enumeration) : Input);
                gameActionInput = (cast hashtable.get(mappedToInput) : Input);
                totalMappedTo++;
                this.getInputMapping().add(gameActionInput, mappedToInput);
            }
        }
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("End - Total Loaded Keys Mapped: ");
        stringBuffer.appendint(this.getTotalMapped());
        stringBuffer.append(" to: ");
        stringBuffer.appendint(totalMappedTo);
        this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.INIT);
    }

    public function setInputMappingEventListenerInterface(inputMappingEventListenerInterface : InputMappingEventListenerInterface) : Void {
        this.inputMappingEventListenerInterface = inputMappingEventListenerInterface;
    }

    private function getInputMappingEventListenerInterface() : InputMappingEventListenerInterface {
        return this.inputMappingEventListenerInterface;
    }

    public function getInputMapping() : InputToGameKeyMapping {
        return this.inputMapping;
    }

    // throws Exception
    public function isDelete(input : Input) : Bool {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function isSystemInput(input : Input) : Bool {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

}

