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


class BasicViewData {
    private static final instance : BasicViewData = new BasicViewData();
    public static function getInstance() : BasicViewData {
        return BasicViewData.instance;
    }

    public function new() {
    }

    public final GENERICDIR : String = "generic/";
    public final USERDIR : String = this.GENERICDIR + "user/";
    public final ADDRESSDIR : String = this.USERDIR + "address/";
    public final BILLINGADDRESSDIR : String = this.ADDRESSDIR + "billing/";
    public final SHIPPINGADDRESSDIR : String = this.ADDRESSDIR + "shipping/";
    public final COMMERCEDIR : String = this.USERDIR + "commerce/";
    public final INVENTORYDIR : String = this.COMMERCEDIR + "inventory/";
    public final BASKETDIR : String = this.INVENTORYDIR + "basket/";
    public final ITEMDIR : String = this.INVENTORYDIR + "item/";
    public final MONEYDIR : String = this.COMMERCEDIR + "money/";
    public final SHIPPINGDIR : String = this.COMMERCEDIR + "shipping/";
    public final ORDERDIR : String = this.INVENTORYDIR + "order/";
    public final ORDEREMAILDIR : String = this.ORDERDIR + "email/";
    public final ORDERHISTORYDIR : String = this.ORDERDIR + "history/";
    public final ORDERREVIEWDIR : String = this.ORDERDIR + "review/";
    public final PAYMENTDIR : String = this.MONEYDIR + "payment/";
    public final GENERATIONDIR : String = this.GENERICDIR + "generation/";
    public final PRODUCTSDIR : String = this.GENERICDIR + "products/";
    public final IGNOREXMLXSL : String = this.GENERICDIR + "ignoreXmlView.xsl";
    public final REVIEWORDERVIEWXSL : String = this.ORDERREVIEWDIR + "reviewOrderView.xsl";
    public final ORDERVIEWXSL : String = this.REVIEWORDERVIEWXSL;
    public final INVENTORYXSL : String = this.INVENTORYDIR + "inventory.xsl";
    public final BASKETXSL : String = this.BASKETDIR + "basket.xsl";
    public final CHECKOUTBASKETXSL : String = this.BASKETDIR + "staticBasket.xsl";
    public final MINIBASKETXSL : String = this.BASKETDIR + "miniBasket.xsl";
    public final BILLINGADDRESSCHANGEFORMXSL : String = this.BILLINGADDRESSDIR + "billingAddressChangeForm.xsl";
    public final BILLINGADDRESSINPUTFORMXSL : String = this.BILLINGADDRESSDIR + "billingAddressInputForm.xsl";
    public final BILLINGADDRESSVIEWXSL : String = this.BILLINGADDRESSDIR + "billingAddressView.xsl";
    public final SHIPPINGADDRESSCHANGEFORMXSL : String = this.SHIPPINGADDRESSDIR + "shippingAddressChangeForm.xsl";
    public final SHIPPINGADDRESSINPUTFORMXSL : String = this.SHIPPINGADDRESSDIR + "shippingAddressInputForm.xsl";
    public final SHIPPINGADDRESSVIEWXSL : String = this.SHIPPINGADDRESSDIR + "shippingAddressView.xsl";
    public final NEWTAXADDRESSXSL : String = this.SHIPPINGADDRESSDIR + "newTaxAddressView.xsl";
    public final EDITTAXADDRESSXSL : String = this.SHIPPINGADDRESSDIR + "editTaxAddressView.xsl";
    public final SHIPPINGMETHODSXSL : String = this.SHIPPINGDIR + "shippingMethods.xsl";
    public final ORDERCUSTOMEREMAILVIEWXSL : String = this.ORDEREMAILDIR + "orderCustomerEmailView.xsl";
    public final ORDERMANAGEREMAILVIEWXSL : String = this.ORDEREMAILDIR + "orderManagerEmailView.xsl";
    public final EDITCUSTOMERXSL : String = this.USERDIR + "editCustomerInputForm.xsl";
    public final ORDERHISTORYXSL : String = this.ORDERHISTORYDIR + "orderHistory.xsl";
    public final PAYMENTVIEWXSL : String = this.PAYMENTDIR + "paymentView.xsl";
    public final SUMMARYXSL : String = this.ITEMDIR + "summary/summary.xsl";
    public final PAYMENTGATEWAYOPTIONSXSL : String = this.PAYMENTDIR + "paymentGatewayOptions.xsl";
    public final MAKEPAYMENTVIEWXSL : String = this.PAYMENTDIR + "invoice/" + "makePayment.xsl";
}

