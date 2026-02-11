let data = {{queryRecord.data}};
data["cancellation_requested_at"] = data.items[0]?.cancellation_request?.created_at;
data["Product categories"] = data.items.map(item => item.category).join("<br/>");
data["buyer_handling_charge_amount"] = data["handling_charges"]["buyer_paid_amount"];
data["seller_handling_charge_amount"] = data["handling_charges"]["seller_paid_amount"];
data["subtotal_cents_before_discount"] = data["subtotal_cents"];
data["coupon_is_global"] = {{queryIsGlobalCoupon_ListingPage.data}}["is_global"][0];
if (!data["coupon_is_global"]) {
  data["subtotal_cents_before_discount"] += data["fixed_amount_coupon_discount_sub_units"] + data["percentage_coupon_discount_sub_units"];
}
return data;