bank.formspec = {
	return_main_formspec = function(balance, accname)
		return "size[8.01,5.32]" ..
		"box[-0.3,-0.32;8.4,0.78;#00FFFF]" ..
		"label[-0.22,-0.32;"..bank.S("Bank").."]" ..
		"label[-0.14,4.27;Balance: "..balance.."]" ..
		"image_button[-0.22,0.54;8.45,0.65;blank.png;transfer;"..bank.S("Transfer").."]" ..
		"image_button[-0.22,1.15;8.45,0.65;blank.png;withdraw;"..bank.S("Withdraw").."]" ..
		"image_button[-0.22,1.76;8.45,0.65;blank.png;entries;"..bank.S("Income log").."]" ..
		"image_button[-0.22,2.36;8.45,0.65;blank.png;shop_cfg;<button not set>]" ..
		"image_button[-0.22,2.97;8.45,0.65;blank.png;deposit;"..bank.S("Deposit").."]" ..
		"image_button[-0.22,3.58;8.45,0.65;blank.png;transfer_log;"..bank.S("Transfer log").."]" ..
		"image_button_exit[-0.22,5.05;8.45,0.74;blank.png;exit;Exit]" ..
		"label[-0.14,0.02;"..accname.."]"
	end,
	return_transfer_formspec = function(balance)
		return "size[5.21,3.58]" ..
		"box[-0.3,-0.32;5.6,0.52;#00BDFF]" ..
		"label[-0.22,-0.32;"..bank.S("Transfer").."]" ..
		"field[0.16,1.43;5.4,0.61;transfer_to;"..bank.S("Transfer to")..":;]" ..
		"label[-0.22,0.28;Balance:"..balance.."]" ..
		"field[0.16,2.21;5.4,0.61;amount;"..bank.S("Amount")..";10]" ..
		"image_button_exit[-0.22,2.54;5.65,0.74;blank.png;transfer;Pay]" ..
		"image_button_exit[-0.22,3.23;5.65,0.74;blank.png;exit;Cancel]"
	end,
	return_deposit_formspec = function(balance)
		return "size[4.01,3.5]" ..
		"box[1.94,0.2;2.24,3.81;#00FF81]" ..
		"box[-0.3,0.2;2.16,3.81;#0000FF]" ..
		"box[-0.3,-0.32;4.45,0.52;#008DFF]" ..
		"label[-0.22,-0.32;"..bank.S("Deposit").."\\, Balance: "..balance.."]" ..
		"image_button[-0.22,0.28;1.17,1.09;blank.png;w_one;$1]" ..
		"image_button[-0.22,1.32;1.17,1.09;blank.png;w_five;$5]" ..
		"image_button[-0.22,2.36;1.17,1.09;blank.png;w_eleven;$10]" ..
		"image_button[0.82,2.36;1.17,1.09;blank.png;w_veinticinco;$25]" ..
		"image_button[0.82,0.28;1.17,1.09;blank.png;w_cincuenta;$50]" ..
		"image_button[0.82,1.32;1.17,1.09;blank.png;w_cien;$100]" ..
		"image_button[2.02,0.28;1.17,1.09;blank.png;w_one_max;$1 All]" ..
		"image_button[2.02,1.32;1.17,1.09;blank.png;w_five_max;$5 All]" ..
		"image_button[2.02,2.36;1.17,1.09;blank.png;w_eleven_max;$10 All]" ..
		"image_button[3.06,2.36;1.17,1.09;blank.png;w_veinticinco_max;$25 All]" ..
		"image_button[3.06,1.32;1.17,1.09;blank.png;w_cien_max;$100\nAll]" ..
		"image_button[3.06,0.28;1.17,1.09;blank.png;w_cincuenta_max;$50\nAll]" ..
		"image_button_exit[-0.22,3.4;4.45,0.57;blank.png;exit;Cancel]"
	end,
	return_transfer_log_formspec = function(transfer_log_raw)
		return "size[6.01,5.32]" ..
		"box[-0.3,-0.32;6.4,0.52;#FFB500]" ..
		"label[-0.22,-0.32;"..bank.S("Transfer log").."]" ..
		"textlist[-0.22,0.28;6.24,4.85;list;"..table.concat(transfer_log_raw, ",")..";1;false]" ..
		"image_button_exit[-0.22,5.22;6.45,0.57;blank.png;exit;Exit]"
	end,
	return_income_log_formspec = function(log_raw)
		return "size[6.01,5.32]" ..
		"box[-0.3,-0.32;6.4,0.52;#FFB500]" ..
		"label[-0.22,-0.32;"..bank.S("Income log").."]" ..
		"textlist[-0.22,0.28;6.24,4.85;list;"..table.concat(log_raw,",")..";1;false]" ..
		"image_button_exit[-0.22,5.22;6.45,0.57;blank.png;exit;Exit]"
	end,
	return_withdraw_formspec = function(balance)
		return "size[4.01,3.5]" ..
		"box[1.94,0.2;2.24,3.81;#00FF81]" ..
		"box[-0.3,0.2;2.16,3.81;#0000FF]" ..
		"box[-0.3,-0.32;4.45,0.52;#008DFF]" ..
		"label[-0.22,-0.32;"..bank.S("Withdraw").."\\, Balance: "..balance.."]" ..
		"image_button[-0.22,0.28;1.17,1.09;blank.png;w_one;$1]" ..
		"image_button[-0.22,1.32;1.17,1.09;blank.png;w_five;$5]" ..
		"image_button[-0.22,2.36;1.17,1.09;blank.png;w_eleven;$10]" ..
		"image_button[0.82,2.36;1.17,1.09;blank.png;w_veinticinco;$25]" ..
		"image_button[0.82,0.28;1.17,1.09;blank.png;w_cincuenta;$50]" ..
		"image_button[0.82,1.32;1.17,1.09;blank.png;w_cien;$100]" ..
		"image_button[2.02,0.28;1.17,1.09;blank.png;w_one_max;$1 All]" ..
		"image_button[2.02,1.32;1.17,1.09;blank.png;w_five_max;$5 All]" ..
		"image_button[2.02,2.36;1.17,1.09;blank.png;w_eleven_max;$10 All]" ..
		"image_button[3.06,2.36;1.17,1.09;blank.png;w_veinticinco_max;$25 All]" ..
		"image_button[3.06,1.32;1.17,1.09;blank.png;w_cien_max;$100\nAll]" ..
		"image_button[3.06,0.28;1.17,1.09;blank.png;w_cincuenta_max;$50\nAll]" ..
		"image_button_exit[-0.22,3.4;4.45,0.57;blank.png;exit;Cancel]"
	end,
}
core.log("action", "[eMoney] Formspecs loaded!")