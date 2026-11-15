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
package org.allbinary.business.user.address;

//import java.util.HashMap;
//import java.util.Set;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class StreetAddress {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var id : String;
    private var name : String;
    private var street : String;
    private var city : String;
    private var state : String;
    private var code : String;
    private var country : String;
    private var isDefault : Bool = false;
    public function new() {
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        final nameNode : Node = DomSearchHelper.getNode(StreetAddressData.NAME, node.getChildNodes());
        this.name = DomNodeHelper.getTextNodeValue(nameNode);
        final streetNode : Node = DomSearchHelper.getNode(StreetAddressData.STREET, node.getChildNodes());
        this.street = DomNodeHelper.getTextNodeValue(streetNode);
        final cityNode : Node = DomSearchHelper.getNode(StreetAddressData.CITY, node.getChildNodes());
        this.city = DomNodeHelper.getTextNodeValue(cityNode);
        final stateNode : Node = DomSearchHelper.getNode(StreetAddressData.STATE, node.getChildNodes());
        this.state = DomNodeHelper.getTextNodeValue(stateNode);
        final codeNode : Node = DomSearchHelper.getNode(StreetAddressData.CODE, node.getChildNodes());
        this.code = DomNodeHelper.getTextNodeValue(codeNode);
        final countryNode : Node = DomSearchHelper.getNode(StreetAddressData.COUNTRY, node.getChildNodes());
        this.country = DomNodeHelper.getTextNodeValue(countryNode);
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(streetAddress : StreetAddress) {
        this.id = streetAddress.getId();
        this.name = streetAddress.getName();
        this.street = streetAddress.getStreet();
        this.city = streetAddress.getCity();
        this.state = streetAddress.getState();
        this.code = streetAddress.getCode();
        this.country = streetAddress.getCountry();
        this.isDefault = streetAddress.isDefault();
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(request : HttpServletRequest) {
        this.setId(request.getParameter(StreetAddressData.ID));
        this.setName(request.getParameter(StreetAddressData.NAME));
        this.setStreet(request.getParameter(StreetAddressData.STREET));
        this.setCity(request.getParameter(StreetAddressData.CITY));
        this.setState(request.getParameter(StreetAddressData.STATE));
        this.setCode(request.getParameter(StreetAddressData.CODE));
        this.setCountry(request.getParameter(StreetAddressData.COUNTRY));
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(name : String, street : String, city : String, state : String, code : String, country : String) {
        this.name = name;
        this.street = street;
        this.city = city;
        this.state = state;
        this.code = code;
        this.country = country;
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(address : HashMap) {
        this.id = (cast address.get(StreetAddressData.ID) : String);
        this.name = (cast address.get(StreetAddressData.NAME) : String);
        this.street = (cast address.get(StreetAddressData.STREET) : String);
        this.city = (cast address.get(StreetAddressData.CITY) : String);
        this.state = (cast address.get(StreetAddressData.STATE) : String);
        this.code = (cast address.get(StreetAddressData.CODE) : String);
        this.country = (cast address.get(StreetAddressData.COUNTRY) : String);
        var def : String = (cast address.get(StreetAddressData.DEFAULT) : String);
        if (def != null && Reflect.compare(def, StreetAddressData.DEFAULT) == 0) {
            this.isDefault = true;
        } else {
            this.isDefault = false;
        }
        this.log();
    }

    private function log() : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
            this.logUtil.putF("Created Address: \n" + this.toHashMap(), this, "log");
        }
    }

    public function setId(id : String) : Void {
        this.id = id;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function setStreet(value : String) : Void {
        this.street = value;
    }

    public function setCity(value : String) : Void {
        this.city = value;
    }

    public function setState(value : String) : Void {
        this.state = value;
    }

    public function setCode(value : String) : Void {
        this.code = value;
    }

    public function setCountry(value : String) : Void {
        this.country = value;
    }

    public function getName() : String {
        return this.name;
    }

    public function getStreet() : String {
        return this.street;
    }

    public function getCity() : String {
        return this.city;
    }

    public function getState() : String {
        return this.state;
    }

    public function getCode() : String {
        return this.code;
    }

    public function getCountry() : String {
        return this.country;
    }

    public function getId() : String {
        return this.id;
    }

    public function isDefault() : Bool {
        return this.isDefault;
    }

    public function isEmpty() : Null<Bool> {
        final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
        if (this.getName() == null && this.getName().compareTo(EMPTY_STRING) == 0 && this.getStreet() == null && this.getStreet().compareTo(EMPTY_STRING) == 0 && this.getCity() == null && this.getCity().compareTo(EMPTY_STRING) == 0 && this.getState() == null && this.getState().compareTo(EMPTY_STRING) == 0 && this.getCode() == null && this.getCode().compareTo(EMPTY_STRING) == 0 && this.getCountry() == null && this.getCountry().compareTo(EMPTY_STRING) == 0) {
            return true;
        }
        return false;
    }

    public function isValid() : Null<Bool> {
        final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
        if (this.getName() == null || this.getName().compareTo(EMPTY_STRING) == 0 || this.getStreet() == null || this.getStreet().compareTo(EMPTY_STRING) == 0 || this.getCity() == null || this.getCity().compareTo(EMPTY_STRING) == 0 || this.getState() == null || this.getState().compareTo(EMPTY_STRING) == 0 || this.getCode() == null || this.getCode().compareTo(EMPTY_STRING) == 0 || this.getCountry() == null || this.getCountry().compareTo(EMPTY_STRING) == 0) {
            return false;
        }
        return true;
    }

    public function validationInfo() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Address Failed To Validate - All fields must contain data.<br></br>");
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (!stringValidationUtil.isValidRequired(this.getName(), StreetAddressData.MIN, StreetAddressData.MAX)) {
            stringBuffer.append("Please enter a valid name");
            stringBuffer.append("<br></br>");
        }
        if (!stringValidationUtil.isValidRequired(this.getStreet(), StreetAddressData.MIN, StreetAddressData.MAX)) {
            stringBuffer.append("Please enter a valid street");
            stringBuffer.append("<br></br>");
        }
        if (!stringValidationUtil.isValidRequired(this.getCity(), StreetAddressData.MIN, StreetAddressData.MAX)) {
            stringBuffer.append("Please enter a valid city");
            stringBuffer.append("<br></br>");
        }
        if (!stringValidationUtil.isValidRequired(this.getState(), StreetAddressData.MIN, StreetAddressData.MAX)) {
            stringBuffer.append("Please enter a valid state");
            stringBuffer.append("<br></br>");
        }
        if (!stringValidationUtil.isValidRequired(this.getCode(), StreetAddressData.MIN, StreetAddressData.MAX)) {
            stringBuffer.append("Please enter a valid zipcode");
            stringBuffer.append("<br></br>");
        }
        if (!stringValidationUtil.isValidRequired(this.getCountry(), StreetAddressData.MIN, StreetAddressData.MAX)) {
            stringBuffer.append("Please enter a valid country");
            stringBuffer.append("<br></br>");
        }
        return Std.string(stringBuffer);
    }

    private function toValidationInfoDoc() : Document {
        return null;
    }

    private function toValidationInfoNode(document : Document) : Node {
        try {
            var node : Node = document.createElement(StreetAddressData.FORM);
            node.appendChild(this.toXmlNode(document));
            return node;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "toValidationInfoNode", e);
            }
            return null;
        }
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(StreetAddressData.ID, this.id);
        hashMap.put(StreetAddressData.NAME, this.name);
        hashMap.put(StreetAddressData.STREET, this.street);
        hashMap.put(StreetAddressData.CITY, this.city);
        hashMap.put(StreetAddressData.STATE, this.state);
        hashMap.put(StreetAddressData.CODE, this.code);
        hashMap.put(StreetAddressData.COUNTRY, this.country);
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var stringUtil : StringUtil = StringUtil.getInstance();
        var hashMap : HashMap = this.toHashMap();
        var keySet : Set = hashMap.keySet();
        var keyArray : haxe.ds.Vector<Any> = keySet.toArray();
        var size : Int = keyArray.length;
        var node : Node = document.createElement(StreetAddressData.ADDRESS);
        for (i in 0...size) {
            var name : String = (cast keyArray[i] : String);
            var value : String = stringUtil.getNonNull((cast hashMap.get(name) : String));
            node.appendChild(ModDomHelper.createNameValueNodes(document, name, value));
        }
        return node;
    }

}

